import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_project/web_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            print('다음 화면으로 이동');
            Navigator.push(context, MaterialPageRoute(builder: (context) => WebScreen()));
          },
          child: Text(
            '다음 화면으로 이동',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
