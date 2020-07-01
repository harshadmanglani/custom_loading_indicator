import 'package:custom_loading_indicator/custom_loading_indicator.dart';
import 'package:flutter/material.dart';

class CustomOscillatoryLoadingIndicator extends StatefulWidget {
  final String imagePath;
  final Curve curveName;
  final int relativeSize;
  final int relativeSpeed;
  final bool spinning;

  CustomOscillatoryLoadingIndicator({
    this.imagePath,
    this.curveName = Curves.ease,
    this.relativeSize = 2,
    this.relativeSpeed = 4,
    this.spinning = true,
  }) : assert(relativeSize >= 1 &&
            relativeSize <= 6 &&
            relativeSpeed >= 1 &&
            relativeSpeed <= 6);

  @override
  _CustomOscillatoryLoadingIndicatorState createState() =>
      _CustomOscillatoryLoadingIndicatorState();
}

class _CustomOscillatoryLoadingIndicatorState
    extends State<CustomOscillatoryLoadingIndicator>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;
  CurvedAnimation _curve;
  double y = 0.0;

  String _imagePath;
  bool _spinning;
  int _relativeSize;
  int _relativeSpeed;

  List<double> relativeSizesList = [30, 45, 60, 80, 100, 120];
  List<int> relativeSpeedsList = [4000, 3000, 2000, 1000, 500, 200, 100];

  @override
  void initState() {
    super.initState();
    _imagePath = widget.imagePath;
    _relativeSize = widget.relativeSize;
    _relativeSpeed = widget.relativeSpeed;
    _spinning = widget.spinning;
    _controller = AnimationController(
        vsync: this,
        duration:
            Duration(milliseconds: relativeSpeedsList[_relativeSpeed - 1]));

    _curve = CurvedAnimation(parent: _controller, curve: widget.curveName);

    _animation = Tween(begin: -45.0, end: 45.0).animate(_curve);

    _controller.addListener(() {
      setState(() {
        y = _animation.value;
      });
    });
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, snapshot) {
          return Transform.translate(
            offset: Offset(0, y),
            child: _spinning
                ? CustomCircularLoadingIndicator(
                    imagePath: _imagePath, relativeSize: _relativeSize)
                : Center(
                    child: Container(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(_imagePath),
                        radius: relativeSizesList[_relativeSize - 1],
                      ),
                    ),
                  ),
          );
        });
  }
}
