import 'package:flutter/material.dart';

import 'button_page.dart';
import 'layout/buildupwidget.dart';

class WidgetDemoPage extends StatelessWidget {
  static final String sName = "WidgetDemoPage";

  List widgets = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget list App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Widget Demo"),
        ),
        body: buildRow(context),
      ),
    );
  }

  Widget buildRow(BuildContext context) =>
      // #docregion Row
      Padding(
        child: Wrap(
            spacing: 10, //- 横轴元素间的间距
            runSpacing: 10, //- 纵轴间距
            alignment: WrapAlignment.spaceBetween, //- 两边对齐
            children: <Widget>[
              ElevatedButton(
                  child: Text("Button"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ButtonPage();
                        },
                      ),
                    );
                  }),
              ElevatedButton(
                  child: Text("Build Up"),
                  onPressed: () {
                    jump(context, BuildUpWidget.sName);
                  }),
            ]),
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      );

  void jump(BuildContext context, String routeName) {
    Navigator.of(context).pushNamed(routeName);
  }
}
