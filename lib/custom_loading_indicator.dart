library custom_loading_indicator;

import 'package:flutter/material.dart';
import './Exceptions/SizeOutOfBoundException.dart';

class CustomCircularLoadingIndicator extends StatefulWidget {
  final dynamic imagePath;
  final dynamic curveName;
  final dynamic size;
  CustomCircularLoadingIndicator(
      {this.imagePath, this.curveName = Null, this.size = 2});
  @override
  _CustomCircularLoadingIndicatorState createState() =>
      _CustomCircularLoadingIndicatorState();
}

class _CustomCircularLoadingIndicatorState
    extends State<CustomCircularLoadingIndicator>
    with TickerProviderStateMixin {
  dynamic _animation;
  AnimationController _controller;
  String imagePath;
  int size;

  String errorMessage;

  List<double> sizesList = [30, 45, 60, 80, 100, 120];

  handleError(String error) {
    if (mounted) {
      setState(() {
        errorMessage = error;
      });
    }
  }

  @override
  void initState() {
    imagePath = widget.imagePath;
    size = widget.size;
    try {
      validateSize(size);
    } catch (e) {
      handleError(e.toString());
    }
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
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

  void validateSize(int _size) {
    if (_size == 0) {
      throw new SizeOutOfBoundException("Size must not be 0");
    } else if (_size < 0) {
      throw new SizeOutOfBoundException("Size cannot be a negative value");
    } else if (_size > 6) {
      throw new SizeOutOfBoundException(
          "Size should be less than or equal to 6");
    }
  }

  @override
  Widget build(BuildContext build) {
    return errorMessage == null
        ? MaterialApp(
            home: RotationTransition(
              turns: _animation == Null ? _controller : _animation,
              child: Center(
                child: Container(
                  width: 400.0,
                  height: 200.0,
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(imagePath),
                    radius: sizesList[size - 1],
                  ),
                ),
              ),
            ),
          )
        : ErrorWidget(errorMessage);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
