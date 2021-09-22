import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/layout/layout_router.dart';
import 'package:flutter_app/routers/fluro_navigator.dart';
import 'package:flutter_app/utils/navigator_utils.dart';
import 'package:flutter_app/widget/my_app_bar.dart';
import 'package:http/http.dart' as http;

import 'layout/buildup_widget.dart';
import 'layout/container_demo.dart';
import 'layout/linearlayout.dart';
import 'layout/relativelayout.dart';
import 'layout/titlerow_layout.dart';

class LayoutPage extends StatelessWidget {
  static final String sName = "LayoutPage";

  List widgets = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        centerTitle: "Widget Demo",
      ),
      body: buildRow(context),
    );
  }

  Widget buildRow(BuildContext context) =>
      // #docregion Row
      Wrap(
          spacing: 10, //- 横轴元素间的间距
          runSpacing: 10, //- 纵轴间距
          alignment: WrapAlignment.spaceBetween, //- 两边对齐
          children: <Widget>[
            ElevatedButton(
              child: Text("组合控件"),
              onPressed: () {
                NavigatorUtils.push(context, '${LayoutRouter.buildUpWidget}?title=sdfsd&detail=aaaa');
              },
            ),
            RaisedButton(
              child: Text("左右格子"),
              onPressed: () {
                Utils.NavigatorRouter(context, new ContainerDemo());
              },
            ),
            FlatButton(
              child: Text("横向纵向排布"),
              onPressed: () {
                Utils.NavigatorRouter(context, new LinearLayoutPage());
              },
            ),
            OutlineButton(
              child: Text("相对布局"),
              onPressed: () {
                Utils.NavigatorRouter(context, new RelativeLayoutPage());
              },
            ),
            RaisedButton.icon(
              icon: Icon(Icons.send),
              label: Text("上下布局"),
              onPressed: () {
                Utils.NavigatorRouter(context, new TitleRowLayout());
              },
            ),
          ]);
}
