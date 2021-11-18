import 'package:flutter/material.dart';

const Duration _kExpand = Duration(milliseconds: 200);

///扩展布局（查看更多，收起）
///在平时的开发中，我们有时会用到扩展布局，这种布局仅显示view的一部分，当点击查看更多时，整个view将会展现。点击收起，又会展示view的一部分。
class ExpansionView extends StatefulWidget {
  final double? defaultHeight;
  final Widget? closeView;
  final Widget? openView;
  final Widget? contentView;

  //默认是否打开
  final bool? defaultYesOpen;

  //这里都是必传的
  ExpansionView(
      {@required this.defaultHeight, @required this.defaultYesOpen, @required this.closeView, @required this.openView, @required this.contentView});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ExpansionViewState();
  }
}

class _ExpansionViewState extends State<ExpansionView> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  //整个高度
  late double _allHeight;

  GlobalKey _textKey = GlobalKey();

  //是否显示控制view
  bool _yesShowControllerView = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(duration: _kExpand, vsync: this);

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      RenderBox? renderBoxRed = _textKey.currentContext!.findRenderObject() as RenderBox?;
      _allHeight = renderBoxRed!.size.height;

      if (_allHeight > widget.defaultHeight!) {
        //显示控制view
        _yesShowControllerView = true;
        _animation = Tween(begin: widget.defaultHeight, end: _allHeight).animate(_controller)
          ..addListener(() {
            setState(() {});
          });
        //默认打开
        if (widget.defaultYesOpen!) {
          if (_animation.value == widget.defaultHeight) {
            _controller.forward();
          }
        } else {
          setState(() {});
        }
      } else {
        _yesShowControllerView = false;
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: Column(
      children: [
        _getContent(),
        _getControllerView(),
      ],
    ));
  }

  Widget _getContent() {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8),
      height: _getHeight(),
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Container(
          child: widget.contentView,
          key: _textKey,
        ),
      ),
    );
  }

  double? _getHeight() {
    //height为null时，是适应子view的高度
    if (_yesShowControllerView) {
      return _animation == 0 ? widget.defaultHeight : _animation.value;
    }
    return 0;
  }

  Widget _getControllerView() {
    if (_yesShowControllerView) {
      if (_animation.value == widget.defaultHeight) {
        return InkWell(
          onTap: () {
            if (_animation.value == widget.defaultHeight) {
              _controller.forward();
            } else {
              _controller.reverse();
            }
          },
          child: widget.openView,
        );
      }
      return InkWell(
        onTap: () {
          if (_animation.value == widget.defaultHeight) {
            _controller.forward();
          } else {
            _controller.reverse();
          }
        },
        child: widget.closeView,
      );
    }
    return SizedBox();
  }
}
