import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          color: Colors.grey[900],
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,
            crossAxisAlignment:
                CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      width: 50,
                      height: 50,
                      color: Colors.red),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.orange,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.yellow,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.green,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.orange,
                  ),
                ],
              ),
              Row(
                //mainAxisSize: MainAxisSize.min,
                mainAxisAlignment:
                    MainAxisAlignment.end,
                children: [
                  Container(
                      width: 50,
                      height: 50,
                      color: Colors.red),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.orange,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.yellow,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.green,
                  ),
                ],
              ),
              Row(
                //mainAxisSize: MainAxisSize.min,
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.green,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
