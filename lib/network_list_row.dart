import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

///网络请求加竖排list
class NetworkListRow extends StatelessWidget {
  static final String sName = "SampleApp";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NetworkListRowPage(),
    );
  }
}

class NetworkListRowPage extends StatefulWidget {
  NetworkListRowPage({Key key}) : super(key: key);

  @override
  _NetworkListRowPageState createState() => _NetworkListRowPageState();
}

class _NetworkListRowPageState extends State<NetworkListRowPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sample App"),
      ),
      body: ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (BuildContext context, int position) {
          return getRow(position);
        },
      ),
    );
  }

  Widget getRow(int i) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text("Row ${widgets[i]["id"]} ${i}++"),
    );
  }

  Future<void> loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = jsonDecode(response.body);
    });
  }
}
