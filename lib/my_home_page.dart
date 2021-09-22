import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/routers/routers.dart';
import 'package:flutter_app/utils/eventbus_util.dart';
import 'package:flutter_app/widget_demo_page.dart';

class MyHomePage extends StatefulWidget {
  static final String sName = "/";

  MyHomePage({Key key, this.title}) : super(key: key) {
    Routes.initRoutes();
  }

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Widget> widgets = [];
  var eventBusFn;
  StreamSubscription<LoginEvent> _loginSubscription;
  StreamSubscription<OrderStatusEvent> _orderStateSubscription;

  String loginStatus = "未登录";

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 100; i++) {
      widgets.add(getRow(i));
    }
    // 注册监听器，订阅 eventbus
    // eventBusFn = eventBus.on<EventFn>().listen((event) {
    //    event为 event.obj 即为 eventBus.dart 文件中定义的 EventFn 类中监听的数据
    // print(event.obj);
    // });
    _loginSubscription = EventBusUtil.listen((event) {
      loginStatus = loginStatus + "登录了,";
      print(loginStatus);
      setState(() {});
    });
    _orderStateSubscription = EventBusUtil.listen((event) {
      loginStatus = loginStatus + "出现了订单状态,";
      print(loginStatus);
      setState(() {});
    });

    ///直接路由跳转会导致'!_debugLocked': is not true.问题
    ///可以使用Future去包含路由跳转
    Future.delayed(Duration.zero, () {
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed(WidgetDemoPage.sName);
    });
  }

  @override
  void dispose() {
    super.dispose();
    //取消订阅
    if (eventBusFn != null) eventBusFn.cancel();
    _loginSubscription?.cancel();
    _orderStateSubscription?.cancel();
  }

  Widget getRow(int i) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text("Row $i"),
      ),
      onTap: () {
        setState(() {
          widgets = List.from(widgets);
          widgets.add(getRow(widgets.length));
          print('row $i');
        });
      },
    );
  }

  bool toggle = true;

  void _toggle() {
    setState(() {
      toggle = !toggle;
      if (toggle) {
        //跳转
        Navigator.of(context).pushNamed('/a');
      } else {
        Navigator.of(context).pushNamed('/b');
      }
    });
  }

  _getToggleChild() {
    if (toggle) {
      return Text('Toggle One');
    } else {
//      return ElevatedButton(onPressed: () {}, child: Text('Toggle Two'));
      return Text('Toggle wne');
    }
  }

  _getNewWidget() {
    return Row(
      children: [
        // new Expanded(
        //   child: new Container(
        //     child: new Icon(
        //       Icons.access_time,
        //       size: 50.0,
        //     ),
        //     color: Colors.red,
        //   ),
        //   flex: 6,
        // ),
        new Expanded(
          child: new Container(
            child: new Icon(
              Icons.pie_chart,
              size: 100.0,
            ),
            color: Colors.blue,
          ),
          flex: 4,
        ),
        new Expanded(
          child: new Container(
            child: new Icon(
              Icons.email,
              size: 150.0,
            ),
            color: Colors.green,
          ),
          flex: 6,
        ),
      ],
    );
  }

  // _getNewWidget() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: <Widget>[
  //       Text('Row One'),
  //       Text('Row Two'),
  //       Text('Row Three'),
  //       Text('Row Four'),
  //     ],
  //   );
  // }
  double _containerHeight = 120, _imageHeight = 80, _iconTop = 44, _iconLeft = 12, _marginLeft = 110;

  _getOtherWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ListView(
          children: <Widget>[
            Text('Row One'),
            Text('Row Two'),
            Text('Row Three'),
            Text('Row Four'),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          height: _containerHeight,
          child: Container(color: Colors.blue),
        ),
        Positioned(
          left: _iconLeft,
          top: _iconTop,
          child: Icon(Icons.settings, color: Colors.white),
        ),
        Positioned(
          right: _iconLeft,
          top: _iconTop,
          child: Icon(Icons.bubble_chart, color: Colors.white),
        ),
//         Positioned(
//           left: _iconLeft,
//           top: _containerHeight - _imageHeight / 2,
//           child: ClipOval(
//               child: Image.asset("assets/images/profile.jpg",
//                   fit: BoxFit.cover,
//                   height: _imageHeight,
//                   width: _imageHeight)),
//         ),
        Positioned(
          left: _marginLeft,
          top: _containerHeight - (_imageHeight / 2.5),
          child: Text("CopsOnRoad", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18)),
        ),
        Positioned.fill(
          left: _marginLeft,
          top: _containerHeight + (_imageHeight / 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("2", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Gold", style: TextStyle(color: Colors.grey)),
                ],
              ),
              Column(
                children: <Widget>[
                  Text("22", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Silver", style: TextStyle(color: Colors.grey)),
                ],
              ),
              Column(
                children: <Widget>[
                  Text("28", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Bronze", style: TextStyle(color: Colors.grey)),
                ],
              ),
              Container(),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _aaaa(),
//        child: _getOtherWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'Update Text',
        child: Icon(Icons.add),
      ),
    );
  }
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text(widget.title),
//     ),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             '意见反馈',
//           ),
//           Text(
//             '$_counter',
//             style: Theme.of(context).textTheme.headline4,
//           ),
//       // AlertDialog(
//       //   title: Text("提示"),
//       //   content: Text("您确定要删除当前文件吗?"),
//       //   actions: <Widget>[
//       //     FlatButton(
//       //       child: Text("取消"),
//       //       onPressed: () => Navigator.of(context).pop(), //关闭对话框
//       //     ),
//       //     FlatButton(
//       //       child: Text("删除"),
//       //       onPressed: () {
//       //         // ... 执行删除操作
//       //         Navigator.of(context).pop(true); //关闭对话框
//       //       },
//       //     ),
//       //   ],
//       // ),
//         ],
//       ),
//     ),
//     floatingActionButton: FloatingActionButton(
//       onPressed: _incrementCounter,
//       tooltip: 'Increment',
//       child: Icon(Icons.add),
//     ), // This trailing comma makes auto-formatting nicer for build methods
//   );
// }

//
// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text(widget.title),
//     ),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text(
//             'You have pushed the button this many times:',
//           ),
//           Text(
//             '$_counter',
//             style: Theme.of(context).textTheme.headline4,
//           ),
//           Text('My Book 《Android群英传》' * 1),
//         ],
//       ),
//     ),
//     floatingActionButton: FloatingActionButton(
//       onPressed: _incrementCounter,
//       tooltip: 'Increment',
//       child: Icon(Icons.add),
//     ), // This trailing comma makes auto-formatting nicer for build methods.
//   );
// }
}

_aaaa() {
  // return ListView(children: widgets);
}
