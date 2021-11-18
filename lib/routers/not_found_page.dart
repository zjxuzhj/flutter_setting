import 'package:flutter/material.dart';
import 'package:flutter_app/widget/my_app_bar.dart';
import 'package:flutter_app/widget/state_layout.dart';

class NotFoundPage extends StatelessWidget {

  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        centerTitle: '页面不存在',
      ),
      body: StateLayout(
        type: StateType.account,
        hintText: '页面不存在',
      ),
    );
  }
}
