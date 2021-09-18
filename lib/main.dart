import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/a_button_page.dart';
import 'package:flutter_app/isolate.dart';
import 'package:flutter_app/network_list_row.dart';
import 'package:flutter_app/utils/eventbus_util.dart';
import 'package:flutter_app/widget_demo_page.dart';

import 'a_layout_page.dart';
import 'animation.dart';
import 'my_home_page.dart';
import 'layout/buildup_widget.dart';
import 'layout/container_demo.dart';
import 'min_function/textfield_limit_page.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
    routes: <String, WidgetBuilder>{
      AnimationFadeAppTest.sName: (BuildContext context) => AnimationFadeAppTest(),
      SampleApp2.sName: (BuildContext context) => SampleApp2(),
      NetworkListRow.sName: (BuildContext context) => NetworkListRow(),
      TextFieldPage.sName: (BuildContext context) => TextFieldPage(),
      WidgetDemoPage.sName: (BuildContext context) => WidgetDemoPage(),
      ButtonPage.sName: (BuildContext context) => ButtonPage(),
      BuildUpWidget.sName: (BuildContext context) => BuildUpWidget(),
      ContainerDemo.sName: (BuildContext context) => ContainerDemo(),
      LayoutPage.sName: (BuildContext context) => LayoutPage(),
    },
  ));
}
