import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter layout demo'),
        ),
        // Change to buildColumn() for the other column example
        body: Center(child: buildRow()),
      ),
    );
  }

  Widget buildRow() =>
      // #docregion Row
  Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Image.asset('assets/images/anim_bg.jpg'),
      Image.asset('assets/images/anim_bg.jpg'),
      Image.asset('assets/images/anim_bg.jpg'),
    ],
  );
  // #enddocregion Row

  Widget buildColumn() =>
      // #docregion Column
  Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Image.asset('assets/images/anim_bg.jpg'),
      Image.asset('assets/images/anim_bg.jpg'),
      Image.asset('assets/images/anim_bg.jpg'),
    ],
  );
// #enddocregion Column
}

