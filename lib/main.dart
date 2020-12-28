import 'package:flutter/material.dart';
import 'package:flutter_app/isolate.dart';

void main() {
  runApp(MaterialApp(
    home: MyHomePage(),
    routes: <String, WidgetBuilder>{
      '/a': (BuildContext context) => DemoApp(),
      '/b': (BuildContext context) => SampleApp2(),
      '/c': (BuildContext context) => DemoApp(),
    },
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Widget> widgets = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 100; i++) {
      widgets.add(getRow(i));
    }
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
  double _containerHeight = 120,
      _imageHeight = 80,
      _iconTop = 44,
      _iconLeft = 12,
      _marginLeft = 110;

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
          child: Text("CopsOnRoad",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 18)),
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
//   // This method is rerun every time setState is called, for instance as done
//   // by the _incrementCounter method above.
//   //
//   // The Flutter framework has been optimized to make rerunning build methods
//   // fast, so that you can just rebuild anything that needs updating rather
//   // than having to individually change instances of widgets.
//   return Scaffold(
//     appBar: AppBar(
//       // Here we take the value from the MyHomePage object that was created by
//       // the App.build method, and use it to set our appbar title.
//       title: Text(widget.title),
//     ),
//     body: Center(
//       // Center is a layout widget. It takes a single child and positions it
//       // in the middle of the parent.
//       child: Column(
//         // Column is also a layout widget. It takes a list of children and
//         // arranges them vertically. By default, it sizes itself to fit its
//         // children horizontally, and tries to be as tall as its parent.
//         //
//         // Invoke "debug painting" (press "p" in the console, choose the
//         // "Toggle Debug Paint" action from the Flutter Inspector in Android
//         // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
//         // to see the wireframe for each widget.
//         //
//         // Column has various properties to control how it sizes itself and
//         // how it positions its children. Here we use mainAxisAlignment to
//         // center the children vertically; the main axis here is the vertical
//         // axis because Columns are vertical (the cross axis would be
//         // horizontal).
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

class FadeAppTest extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fade Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyFadeTest(title: 'Fade Demo'),
    );
  }
}

class MyFadeTest extends StatefulWidget {
  MyFadeTest({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyFadeTest createState() => _MyFadeTest();
}

class _MyFadeTest extends State<MyFadeTest> with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    curve = CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Container(
              child: FadeTransition(
                  opacity: curve,
                  child: FlutterLogo(
                    size: 100.0,
                  )))),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Fade',
        child: Icon(Icons.brush),
        onPressed: () {
          controller.forward();
        },
      ),
    );
  }
}

class DemoApp extends StatelessWidget {
  Widget build(BuildContext context) => Scaffold(body: Signature());
}

class Signature extends StatefulWidget {
  SignatureState createState() => SignatureState();
}

class SignatureState extends State<Signature> {
  List<Offset> _points = <Offset>[];

  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (DragUpdateDetails details) {
        setState(() {
          RenderBox referenceBox = context.findRenderObject();
          Offset localPosition =
              referenceBox.globalToLocal(details.globalPosition);
          _points = List.from(_points)..add(localPosition);
        });
      },
      onPanEnd: (DragEndDetails details) => _points.add(null),
      child: CustomPaint(
        painter: SignaturePainter(_points),
        size: Size.infinite,
      ),
    );
  }
}

class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);

  final List<Offset> points;

  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null)
        canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  bool shouldRepaint(SignaturePainter other) => other.points != points;
}
