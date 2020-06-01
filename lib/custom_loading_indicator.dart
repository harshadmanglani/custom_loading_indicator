library custom_loading_indicator;
import 'package:flutter/material.dart';

class CustomCircularLoadingIndicator extends StatefulWidget {
  final dynamic imagePath;
  final dynamic curveName;
  CustomCircularLoadingIndicator({this.imagePath, this.curveName = Null});
  @override
  _CustomCircularLoadingIndicatorState createState() => _CustomCircularLoadingIndicatorState();
}

class _CustomCircularLoadingIndicatorState extends State<CustomCircularLoadingIndicator> with TickerProviderStateMixin {
  dynamic _animation;
  AnimationController _controller;
  String imagePath;

  @override
  void initState() {
    imagePath = widget.imagePath;
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    if (widget.curveName != Null) {
      _animation = new Tween(begin: 0.5, end: 1.0).animate(
        new CurvedAnimation(parent: _controller, curve: widget.curveName,)
      );
    }
    else
    {
      _animation = Null;
    }
    _controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext build) {
    return MaterialApp(
      home: RotationTransition(
        turns: _animation == Null ? _controller : _animation,
        child: Center(
          child: Container(
            width: 400.0,
            height: 200.0,
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 45.0,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
