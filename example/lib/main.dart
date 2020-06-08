import 'package:flutter/material.dart';
import 'package:custom_loading_indicator/custom_loading_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CustomCircularLoadingIndicator(
      imagePath: 'images/tooth.png',
    )
        //relativeSize is an optional argument, by default it is set to 2 ( 1 <= relativeSize <= 6 )
        //curveName is an optional argument - an object of the Curves class in Flutter
        //relativeSpeed is an optional argument, by default it is set to 2 ( 1 <= relativeSpeed <= 6)
        );
  }
}
