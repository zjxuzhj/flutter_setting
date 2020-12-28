import 'package:flutter/material.dart';

/// 创建一个在构造器接收标签参数的 CustomButton
void main() {
  runApp(MaterialApp(
    home: CustomButtonPage(),
  ));
}

class CustomButtonPage extends StatefulWidget {
  CustomButtonPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  BaseState createState() => BaseState();
}

class BaseState extends State<CustomButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomButton("Hello"),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;

  CustomButton(this.label);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: Text(label));
  }
}