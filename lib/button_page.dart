import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ButtonPage extends StatelessWidget {
  static final String sName = "ButtonPage";

  List widgets = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget list App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Widget Demo"),
        ),
        body: buildRow(),
      ),
    );
  }

  Widget buildRow() =>
      // #docregion Row
      Column(children: [
        ElevatedButton(
          child: Text("ElevatedButton"),
          onPressed: () {},
        ),
        RaisedButton(
          child: Text("RaisedButton"),
          onPressed: () {},
        ),
        FlatButton(onPressed: () {}, child: Text("FlatButton")),
        OutlineButton(
          child: Text("OutlineButton"),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.thumb_up),
          onPressed: () {},
        ),
        RaisedButton.icon(onPressed: () {}, icon: Icon(Icons.send), label: Text("发送")),
        FlatButton(
          color: Colors.blue,
          highlightColor: Colors.blue[700],
          colorBrightness: Brightness.dark,
          splashColor: Colors.grey,
          child: Text("Submit"),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: () {},
        ),
        RaisedButton(
          color: Colors.blue,
          highlightColor: Colors.blue[700],
          colorBrightness: Brightness.dark,
          splashColor: Colors.grey,
          child: Text("Submit"),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: () {},
        ),
        //自定义button
        FlatButton(
            color: Colors.amberAccent,
            onPressed: () {},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.label_important_outlined), Text("喜欢")],
            )),
      ]);
}
