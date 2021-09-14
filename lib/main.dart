import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/button_page.dart';
import 'package:flutter_app/isolate.dart';
import 'package:flutter_app/new.dart';
import 'package:flutter_app/utils/EventBusUtil.dart';
import 'package:flutter_app/widget_demo_page.dart';

import 'animation.dart';
import 'app.dart';
import 'layout/buildupwidget.dart';
import 'min_function/textfield_limit_page.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
    routes: <String, WidgetBuilder>{
      AnimationFadeAppTest.sName: (BuildContext context) => AnimationFadeAppTest(),
      SampleApp2.sName: (BuildContext context) => SampleApp2(),
      SampleApp.sName: (BuildContext context) => SampleApp(),
      TextFieldPage.sName: (BuildContext context) => TextFieldPage(),
      WidgetDemoPage.sName: (BuildContext context) => WidgetDemoPage(),
      ButtonPage.sName: (BuildContext context) => ButtonPage(),
      BuildUpWidget.sName: (BuildContext context) => BuildUpWidget(),
    },
  ));
}
