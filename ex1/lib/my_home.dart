import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purpleAccent,
        body: SafeArea(
            child: Center(
                child: Text(
                  'Hello world',
                  style: TextStyle(fontSize: 30),
                ))));
  }
}