import 'package:flutter/material.dart';

class CustomFadeLoadingIndicator extends StatefulWidget {
  final String imagePath;
  final Curve curveName;
  final int relativeSize;
  final int relativeSpeed;

  CustomFadeLoadingIndicator(
      {this.imagePath,
      this.curveName = Curves.easeIn,
      this.relativeSize = 2,
      this.relativeSpeed = 4})
      : assert(relativeSize >= 1 &&
            relativeSize <= 6 &&
            relativeSpeed >= 1 &&
            relativeSpeed <= 6);

  @override
  _CustomFadeLoadingIndicatorState createState() =>
      _CustomFadeLoadingIndicatorState();
}

class _CustomFadeLoadingIndicatorState extends State<CustomFadeLoadingIndicator>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  CurvedAnimation _curve;
  String _imagePath;
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
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: relativeSpeedsList[_relativeSpeed - 1]),
    )
      ..addListener(() => setState(() {}))
      ..repeat(reverse: true);

    _curve = CurvedAnimation(parent: _controller, curve: widget.curveName);

    _animation = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(_curve);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: Center(
        child: Container(
            // width: 200.0,
            // height: 200.0,
            child: CircleAvatar(
          backgroundImage: AssetImage(_imagePath),
          radius: relativeSizesList[_relativeSize - 1],
        )),
      ),
      opacity: _animation,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
