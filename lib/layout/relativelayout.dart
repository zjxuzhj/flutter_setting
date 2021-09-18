import 'dart:ui';

import 'package:flutter/material.dart';

///获得屏幕宽高
final width = window.physicalSize.width;
final height = window.physicalSize.height;

///绝对布局和相对布局
class RelativeLayoutPage extends StatefulWidget {
  static final String sName = "RelativeLayoutPage";

  RelativeLayoutPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  BaseState createState() => BaseState();
}

class BaseState extends State<RelativeLayoutPage> {
  final TextStyle baseStyle = TextStyle(color: Color(0xff124567), fontSize: 22);

  @override
  Widget build(BuildContext context) {
    /// 用于展示层叠布局绝对定位 stack
    /// 其childWidget 可以层叠到一起，层叠顺序：Widget越后创建，层级越靠上
//    return Stack(
//      children: <Widget>[
//        Positioned(left: 0.0, child: Text("Top\nleft", style: baseStyle)),
//        Positioned(bottom: 0.0, child: Text("Bottom\nleft", style: baseStyle)),
//        Positioned(top: 0.0, right: 0.0, child: Text("Top\nright", style: baseStyle)),
//        Positioned(bottom: 0.0, right: 0.0, child: Text("Bottom\nright", style: baseStyle)),
//        Positioned(left: 120, top: 350, child: Text("Center", style: baseStyle)),
//        Positioned(top: 350, child: Text("Center\nleft", style: baseStyle)),
//        Positioned(top: 350, right: 0.0, child: Text("Center\nright", style: baseStyle)),
//        Positioned(left: 120, child: Text("Center\ntop", style: baseStyle)),
//        Positioned(left: 120, bottom: 0.0, child: Text("Center\nbottom", style: baseStyle)),
//      ],
//    );

    /// 使用 align 实现相对布局
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Text("Center", style: baseStyle),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Text("Top\nRight", style: baseStyle),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text("Center\nRight", style: baseStyle),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Text("Bottom\nRight", style: baseStyle),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text("Top\nLeft", style: baseStyle),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Center\nLeft", style: baseStyle),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Text("Bottom\nLeft", style: baseStyle),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Text("Top\nCenter", style: baseStyle),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Text("Bottom\nCenter", style: baseStyle),
        ),
        Align(
          alignment: Alignment(0.0, 0.5),
          child: Text(
            "Custom\nPostition",
            style: TextStyle(color: Colors.red, fontSize: 20.0, fontWeight: FontWeight.w800),
          ),
        ),
      ],
    );
  }
}
