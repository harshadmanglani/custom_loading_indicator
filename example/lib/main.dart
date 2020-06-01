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
      child: CustomCircularLoadingIndicator(imagePath: 'images/tooth.png')  
    );
  }
}