
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widget/my_app_bar.dart';

import 'layout/models/category_entity.dart';
import 'net/dio_utils.dart';
import 'net/http_api.dart';

class ButtonPage extends StatelessWidget {
  static final String sName = "ButtonPage";

  List widgets = [];
  var _cancelToken = CancelToken();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        centerTitle: "Widget Demo",
      ),
      body: buildRow(),
    );
  }

  void getHttp() async {
    try {
      var response = await Dio().get('https://www.baidu.com');
      print(response);
    } catch (e) {
      print(e);
    }
  }

  /// 返回Future 适用于刷新，加载更多
  Future requestNetwork<T>(
    Method method, {
    String? url,
    bool isShow = true,
    bool isClose = true,
    NetSuccessCallback<T>? onSuccess,
    NetErrorCallback? onError,
    dynamic params,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
  }) {
    if (isShow) {}
    return DioUtils.instance.requestNetwork<T>(
      method,
      url!,
      params: params,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken ?? _cancelToken,
      onSuccess: (data) {
        if (isClose) {}
        onSuccess?.call(data!);
      },
      onError: (code, msg) {},
    );
  }

  Future search(String text, int page, bool isShowDialog) {
    final Map<String, String> params = <String, String>{};
    params['q'] = text;
    params['page'] = page.toString();
    params['l'] = 'Dart';
    return requestNetwork<Category>(Method.get, url: HttpApi.categoryListAll, queryParameters: params, isShow: isShowDialog, onSuccess: (data) {
      /// 加载成功
      print(data);
      print(data.data!.categoryList![0].categoryName);
    }, onError: (_, __) {
      /// 加载失败
    });
  }

  Widget buildRow() =>
      // #docregion Row
      Column(children: [
        ElevatedButton(
          child: Text("ElevatedButton"),
          onPressed: () {
            // getHttp();
            search("aaaa", 1, true);
          },
        ),
        RaisedButton(
          child: Text("RaisedButton"),
          onPressed: () {},
        ),
        FlatButton(onPressed: () {}, child: Text("FlatButton")),
        OutlineButton(
          child: Text("OutlineButton"),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.thumb_up),
          onPressed: () {},
        ),
        RaisedButton.icon(onPressed: () {}, icon: Icon(Icons.send), label: Text("发送")),
        FlatButton(
          color: Colors.blue,
          highlightColor: Colors.blue[700],
          colorBrightness: Brightness.dark,
          splashColor: Colors.grey,
          child: Text("Submit"),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: () {},
        ),
        RaisedButton(
          color: Colors.blue,
          highlightColor: Colors.blue[700],
          colorBrightness: Brightness.dark,
          splashColor: Colors.grey,
          child: Text("Submit"),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          onPressed: () {},
        ),
        //自定义button
        FlatButton(
            color: Colors.amberAccent,
            onPressed: () {},
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [Icon(Icons.label_important_outlined), Text("喜欢")],
            )),
      ]);
}
