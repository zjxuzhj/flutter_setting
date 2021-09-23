import 'package:flutter/material.dart';

/// 用于横向纵向排布widget（Row横向和Column纵向）
class LinearLayoutPage extends StatelessWidget {

  final TextStyle baseStyle = TextStyle(color: Color(0xff124567), fontSize: 22);

  @override
  Widget build(BuildContext context) {
    return rowImage();
  }

  ///Column 纵向排布 android:orientation="vertical”
  Widget columnText() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, //将主轴空白区域均分，使各个子控件间距相等
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text('Column One'),
          Text('Column Two'),
          Text('Column Three'),
          Text('Column Four'),
        ],
      );

  ///Row 横向排布  android:orientation="horizontal"
  Widget rowText() => Row(
        ///对齐方式 gravity
        // mainAxisAlignment: MainAxisAlignment.start, //android:gravity="start"
        // mainAxisAlignment: MainAxisAlignment.center, //android:gravity="center_horizontal"

        /// 主轴空间分布
        // mainAxisAlignment: MainAxisAlignment.spaceBetween, //将主轴空白位置进行均分，排列子元素，首尾没有空隙
        // mainAxisAlignment: MainAxisAlignment.spaceAround, //主空均分，使中间各个子控件间距相等，首尾子控件间距为中间子控件
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //主空均分，使各个子控件间距相等

        /// 交叉轴分布间距的一半
        crossAxisAlignment: CrossAxisAlignment.center,

        ///控件宽度 wrap_content 和 match_parent
        ///Row/Column组件如果没有设置mainAxisSize属性，默认为max属性值
        mainAxisSize: MainAxisSize.min,
        //wrap_content
        //mainAxisSize: MainAxisSize.max, //match_parent

        ///Row textDirection 的属性值为 TextDirection.ltr，
        ///Column verticalDirection 的属性值为 VerticalDirection.down，
        textDirection: TextDirection.ltr,
        //所有的子控件都是从左到右顺序排列，默认值。
        //textDirection: TextDirection.rtl, //表示从右边开始向左边倒序排列。

        children: <Widget>[
          Text('Row One', style: baseStyle),
          Text('Row Two', style: baseStyle),
          // Text('Row Three', style: baseStyle),
          // Text('Row Four', style: baseStyle),
        ],
      );

  var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.star, color: Colors.green[500]),
      Icon(Icons.star, color: Colors.green[500]),
      Icon(Icons.star, color: Colors.green[500]),
      Icon(Icons.star, color: Colors.black),
      Icon(Icons.star, color: Colors.black),
    ],
  );

  Widget rowImage() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //  Expanded widget 缩放图像，防止图像出边界  widget 的弹性系数的整数
          Expanded(flex: 4, child: Image.asset('assets/images/icon_error_close.png')),
          Expanded(flex: 2, child: Image.asset('assets/images/icon_error_close.png')),
          Expanded(child: Image.asset('assets/images/icon_error_close.png')),
          Image.asset('assets/images/icon_error_close.png'),
          Image.asset('assets/images/icon_error_close.png'),
          Image.asset('assets/images/icon_error_close.png'),
        ],
      );

  Widget buildUpWidget() => Column();
}
