import 'package:flutter/material.dart';

/// 用于展示线性布局（Row横向和Column纵向）
void main() {
  runApp(MaterialApp(
    home: LinearLayoutPage(),
  ));
}

class LinearLayoutPage extends StatefulWidget {
  LinearLayoutPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  BaseState createState() => BaseState();
}

class BaseState extends State<LinearLayoutPage> {
  @override
  Widget build(BuildContext context) {
    ///Column 纵向排布
//    return Column(
//      mainAxisAlignment: MainAxisAlignment.end,
//      children: <Widget>[
//        Text('Column One'),
//        Text('Column Two'),
//        Text('Column Three'),
//        Text('Column Four'),
//      ],
//    );

    ///Row 横向排布
    return Row(
      ///对齐方式 gravity
      //android:gravity="start"
      mainAxisAlignment: MainAxisAlignment.start,
      //android:gravity="center_horizontal"
      //mainAxisAlignment: MainAxisAlignment.center,

      ///控件宽度 wrap_content 和 match_parent
      //wrap_content
      mainAxisSize: MainAxisSize.min,
      //match_parent
      //mainAxisSize: MainAxisSize.max,

      children: <Widget>[
        Text('Row One'),
//        Text('Row Two'),
//        Text('Row Three'),
//        Text('Row Four'),
      ],
    );
  }
}
