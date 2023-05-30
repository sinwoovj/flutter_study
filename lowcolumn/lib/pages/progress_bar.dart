import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return;
  }
}

class CircularProgressBar
    extends StatelessWidget {
  const CircularProgressBar({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      color: Colors.red,
    ));
  }
}
