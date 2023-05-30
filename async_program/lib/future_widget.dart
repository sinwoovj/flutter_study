import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class future_widget extends StatelessWidget {
  const future_widget({Key? key}) : super(key: key);
  Future<String> getNickname() async {
    await Future.delayed(
      Duration(milliseconds: 5000),
    );
    Random random = Random();
    int index = random.nextInt(10);
    if (index > 5) {
      return 'UMR';
    } else {
      return Future.error('random error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder(
            future: getNickname(),
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
                return Container(
                  color: Colors.lime,
                  child: Text('환영합니다. $myResult님'),
                );
              }
              return SizedBox.shrink();
            },
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.brown,
          ),
        ),
      ],
    );
  }
}
