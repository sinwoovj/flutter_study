import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StreamWidget extends StatelessWidget {
  StreamWidget({Key? key}) : super(key: key);
  //Stream<String> chatList = Stream.periodic(Duration(milliseconds: 500), (index) => 'ABC : $index');
  Stream<String> chatList() async* {
    for (int i = 0; i < 5; i++) {
      await Future.delayed(Duration(milliseconds: 3000));
      yield i.toString();
    }
  }

  List<String> chatMessages = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: chatList(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (snapshot.hasError) {
                  print('에러발생 ${snapshot.error}');
                  return Container(
                    child: Text('에러발생 ${snapshot.error}'),
                  );
                }
                if (snapshot.hasData) {
                  String myResult = snapshot.data ?? '자료없음';
                  chatMessages.add(myResult);
                  return Container(
                    color: Colors.lime,
                    child: Column(
                      children: chatMessages.map((e) => Text(e)).toList(),
                    ),
                  );
                }
                return SizedBox.shrink();
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.brown,
            ),
          ),
        ],
      ),
    );
  }
}
