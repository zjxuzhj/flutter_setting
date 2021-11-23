import 'package:flutter/material.dart';
import 'package:flutter_app/a_button_page.dart';
import 'package:flutter_app/isolate.dart';
import 'package:flutter_app/network_list_row.dart';
import 'package:flutter_app/widget_demo_page.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'a_layout_page.dart';
import 'animation.dart';
import 'my_home_page.dart';
import 'min_function/textfield_limit_page.dart';

void main() {
  //没啥用的路由表
  Map<String, WidgetBuilder> routesMap = {
    AnimationFadeAppTest.sName: (BuildContext context) => AnimationFadeAppTest(),
    SampleApp2.sName: (BuildContext context) => SampleApp2(),
    NetworkListRow.sName: (BuildContext context) => NetworkListRow(),
    TextFieldPage.sName: (BuildContext context) => TextFieldPage(),
    WidgetDemoPage.sName: (BuildContext context) => WidgetDemoPage(),
    ButtonPage.sName: (BuildContext context) => ButtonPage(),
    LayoutPage.sName: (BuildContext context) => LayoutPage(),
  };

  runApp(OKToast(
      child: MaterialApp(
        home: MyHomePage(),
        routes: routesMap ,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
      backgroundColor: Colors.black54,
      textPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      radius: 20.0,
      position: ToastPosition.bottom));
}
