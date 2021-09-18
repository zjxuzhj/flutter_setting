import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/widget/expansion_view.dart';
import 'package:flutter_app/widget/money_text_input_formatter.dart';

///flutter TextField 金额输入 保留2位小数
class TextFieldPage extends StatefulWidget {
  static final String sName = "TextFieldPage";

  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: Center(
        // child: TextField(
        //   keyboardType: TextInputType.number,
        //   enableInteractiveSelection: false,
        //   inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9.]")), LengthLimitingTextInputFormatter(9), MoneyTextInputFormatter()],
        //   controller: _textEditingController,
        // ),
          child: ExpansionView(
              defaultHeight: 100,
              defaultYesOpen: false,
              closeView: Container(
                width: 100,
                height: 50,
                color: Colors.pink,
                child: Text('关闭'),
              ),
              openView: Container(
                width: 100,
                height: 50,
                color: Colors.yellow,
                child: Text('打开'),
              ),
              contentView: Text('asdasdasdasdasdas'
                  'dsadasdasdasdasdasda'
                  'dsadasdasdasdasdasda'
                  'dsadasdasdasdasdasda'
                  'dsadasdasdasdasdasda'
                  'dsadasdasdasdasdasda'
                  'dsadasdasdasdasdasda'
                  'dsadasdasdasdasdasda'
                  'dsadasdasdasdasdasda'
                  'dsadasdasdasdasdasda'
                  'dsadasdasdasdasdasda'
                  'sdasdadasdsadasdasd'
                  'sadasdasdasdasdasdasdas'
                  'dadasdsadasdasdsadasdas'
                  'dasdasdasdasdasdadasdsada'
                  'sdasdsadasdasdasdasdasdasda'
                  'sdadasdsadasdasdasdadsdasdasd'
                  'sadasdaaaaaaasdasdasdasd')),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textEditingController.dispose();
    super.dispose();
  }
}
