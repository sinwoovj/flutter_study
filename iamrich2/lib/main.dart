import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: MyHome()));
}

class MyHome extends StatelessWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFffadff),
      appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text('브라보 박연진',
              style: TextStyle(fontFamily: 'KCC'), textAlign: TextAlign.center),
          centerTitle: true),
      body: Column(
        children: [
          Image.asset("asset/image/kong.gif"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text('치잇-스'), Icon(Icons.handshake)],
          ),
        ],
      ),
    );
  }
}
