import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: StackPage(),
  ));
}

class StackPage extends StatelessWidget {
  const StackPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.indigo,
            ),
            Container(
              width: 300,
              height: 300,
              color: Colors.lime,
              child: Icon(
                Icons.stop_circle_outlined,
                color: Colors.red,
                size: 60,
              ),
            ),
            Container(
                width: 100,
                height: 100,
                color: Colors.pink,
                child: Column(
                  children: [
                    Text('안녕'),
                    Text('어쩔')
                  ],
                )),
            Container(
              width: 200,
              height: 200,
              color: Colors.deepPurpleAccent[200],
            ),
            Center(
                child: SizedBox(
              width: 150,
              height: 150,
              child: CircularProgressIndicator(
                color: Colors.grey,
                backgroundColor:
                    Colors.cyanAccent,
                strokeWidth: 20,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
