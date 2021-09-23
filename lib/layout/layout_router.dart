import 'package:fluro/fluro.dart';
import 'package:flutter_app/layout/relativelayout.dart';
import 'package:flutter_app/layout/titlerow_layout.dart';
import 'package:flutter_app/routers/i_router.dart';

import 'buildup_widget.dart';
import 'container_demo.dart';
import 'linearlayout.dart';

class LayoutRouter implements IRouterProvider {
  static String layoutPage = '/layout';
  static String buildUpWidget = '$layoutPage/BuildUpWidget';
  static String containerDemo = '$layoutPage/ContainerDemo';
  static String linearLayoutPage = '$layoutPage/LinearLayoutPage';
  static String relativeLayoutPage = '$layoutPage/RelativeLayoutPage';
  static String titleRowLayout = '$layoutPage/TitleRowLayout';

  @override
  void initRouter(FluroRouter router) {
    router.define(buildUpWidget, handler: Handler(handlerFunc: (_, Map<String, List<String>> params) {
      final String title = params['title']?.first ?? '';
      final String detail = params['detail']?.first ?? '';
      return BuildUpWidget(title: title, detail: detail);
    }));
    router.define(containerDemo, handler: Handler(handlerFunc: (_, Map<String, List<String>> params) {
      final String title = params['title']?.first ?? '';
      final String detail = params['detail']?.first ?? '';
      return ContainerDemo(title: title, detail: detail);
    }));
    router.define(linearLayoutPage, handler: Handler(handlerFunc: (_, __) => LinearLayoutPage()));
    router.define(relativeLayoutPage, handler: Handler(handlerFunc: (_, __) => RelativeLayoutPage()));
    router.define(titleRowLayout, handler: Handler(handlerFunc: (_, __) => TitleRowLayout()));
  }
}
