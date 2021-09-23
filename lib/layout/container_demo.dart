import 'package:flutter/material.dart';
import 'package:flutter_app/routers/fluro_navigator.dart';
import 'package:flutter_app/widget/my_app_bar.dart';

///左右格子布局
class ContainerDemo extends StatelessWidget {
  const ContainerDemo({
    Key key,
    this.title,
    this.detail,
  }) : super(key: key);

  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        centerTitle: 'Flutter layout demo',
      ),
      body: Center(child: _buildImageColumn(context)),
    );
  }

  Widget _buildDecoratedImage(int imageIndex, BuildContext context) => Expanded(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 10, color: Colors.black38),
            borderRadius: const BorderRadius.all(const Radius.circular(8)),
          ),
          margin: const EdgeInsets.all(4),
          child: GestureDetector(
            child: Image.asset('images/pic$imageIndex.jpg'),
            onTap: () {
              NavigatorUtils.goBackWithParams(context, "我回来啦，表哥");
            },
          ),
        ),
      );

  Widget _buildImageRow(int imageIndex, BuildContext context) => Row(
        children: [
          _buildDecoratedImage(imageIndex, context),
          _buildDecoratedImage(imageIndex + 1, context),
        ],
      );

  Widget _buildImageColumn(BuildContext context) => Container(
        decoration: BoxDecoration(color: Colors.black26),
        child: Column(
          children: [
            _buildImageRow(1, context),
            // _buildImageRow(3),
          ],
        ),
      );
}
