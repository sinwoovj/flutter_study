import 'package:flutter/material.dart';

Text buildTitle(String indexNum, String name) {
  return Text(
    'No.${indexNum}  ${name}\n',
    style: TextStyle(fontSize: 36),
  );
}
