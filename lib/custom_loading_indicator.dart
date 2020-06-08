library custom_loading_indicator;

import 'package:flutter/material.dart';

class CustomCircularLoadingIndicator extends StatefulWidget {
  final dynamic imagePath;
  final dynamic curveName;
  final dynamic relativeSize;
  final dynamic relativeSpeed;
  CustomCircularLoadingIndicator(
      {this.imagePath, this.curveName = Null, this.relativeSize = 2, this.relativeSpeed = 2}):assert(relativeSize>=1 && relativeSize<=6 && relativeSpeed>=1 && relativeSpeed<=6);
  @override
  _CustomCircularLoadingIndicatorState createState() =>
      _CustomCircularLoadingIndicatorState();
}

class _CustomCircularLoadingIndicatorState
    extends State<CustomCircularLoadingIndicator>
    with TickerProviderStateMixin {
  dynamic _animation;
  AnimationController _controller;
  String _imagePath;
  int _relativeSize;
  int _relativeSpeed;

  List<double> relativeSizesList = [30, 45, 60, 80, 100, 120];
  List<int> relativeSpeedsList = [4000, 2000, 1000, 500, 200, 100];

  @override
  void initState() {
    _imagePath = widget.imagePath;
    _relativeSize = widget.relativeSize;
    _relativeSpeed = widget.relativeSpeed;
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: relativeSpeedsList[_relativeSpeed-1]));
    if (widget.curveName != Null) {
      _animation = new Tween(begin: 0.5, end: 1.0).animate(new CurvedAnimation(
        parent: _controller,
        curve: widget.curveName,
      ));
    } else {
      _animation = Null;
    }
    _controller.repeat();
    super.initState();
  }

  @override
  Widget build(BuildContext build) {
         return MaterialApp(
            home: RotationTransition(
              turns: _animation == Null ? 
              _controller : _animation,
              child: Center(
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(_imagePath),
                    radius: relativeSizesList[_relativeSize - 1],
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
