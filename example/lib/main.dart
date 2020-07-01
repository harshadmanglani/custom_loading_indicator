import 'package:flutter/material.dart';
import 'package:custom_loading_indicator/custom_loading_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// CHECK LINES 49 ONWARDS FOR THE SAMPLE IMPLEMENTATIONS

// Kindly gnore this code, it has nothing to with the implementations
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/CustomCircularExample': (BuildContext context) =>
              CustomCircularExample(),
          '/CustomFadeExample': (BuildContext context) => CustomFadeExample(),
          '/CustomOscillatoryExample': (BuildContext context) =>
              CustomOscillatoryExample()
        },
        home: Builder(
          builder: (context) => Container(
              child: SafeArea(
            child: Column(
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/CustomCircularExample');
                  },
                  child: Text("Custom Loading Indicator",
                      overflow: TextOverflow.clip),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/CustomFadeExample');
                  },
                  child: Text("Custom Fading Indicator",
                      overflow: TextOverflow.clip),
                ),
                RaisedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/CustomOscillatoryExample');
                  },
                  child: Text("Custom Oscillatory Indicator",
                      overflow: TextOverflow.clip),
                )
              ],
            ),
          )),
        ));
  }
}

// NOTE: '/images/tooth.png' is a registered asset in the pubspec.yaml file
// EXAMPLE - USING THE CUSTOM CIRCULAR LOADING INDICATOR
class CustomCircularExample extends StatefulWidget {
  @override
  _CustomCircularExampleState createState() => _CustomCircularExampleState();
}

class _CustomCircularExampleState extends State<CustomCircularExample> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomCircularLoadingIndicator(imagePath: 'images/tooth.png'),
      //relativeSize is an optional argument, by default it is set to 2 ( 1 <= relativeSize <= 6 )

      //curveName is an optional argument - an object of the Curves class in Flutter - it is possible that
      //specificying a curve here could mess with the animation because of Tween values.

      //relativeSpeed is an optional argument, by default it is set to 2 ( 1 <= relativeSpeed <= 6)
    );
  }
}

// EXAMPLE - USING THE CUSTOM FADE LOADING INDICATOR
class CustomFadeExample extends StatefulWidget {
  @override
  _CustomFadeExampleState createState() => _CustomFadeExampleState();
}

class _CustomFadeExampleState extends State<CustomFadeExample> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomFadeLoadingIndicator(imagePath: 'images/tooth.png'),
      //relativeSize is an optional argument, by default it is set to 2 ( 1 <= relativeSize <= 6 )

      //curveName is an optional argument - an object of the Curves class in Flutter - it is possible that
      //specificying a curve here could mess with the animation because of Tween values.

      //relativeSpeed is an optional argument, by default it is set to 4 ( 1 <= relativeSpeed <= 6)
    );
  }
}

// EXAMPLE - USING THE CUSTOM OSCILLATORY LOADING INDICATOR
class CustomOscillatoryExample extends StatefulWidget {
  @override
  _CustomOscillatoryExampleState createState() =>
      _CustomOscillatoryExampleState();
}

class _CustomOscillatoryExampleState extends State<CustomOscillatoryExample> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: CustomOscillatoryLoadingIndicator(imagePath: 'images/tooth.png'),
      //spinning is an optional argument, by default it is set to true, pass false to stop the spinning
      //relativeSize is an optional argument, by default it is set to 2 ( 1 <= relativeSize <= 6 )

      //curveName is an optional argument - an object of the Curves class in Flutter - it is possible that
      //specificying a curve here could mess with the animation because of Tween values.

      //relativeSpeed is an optional argument, by default it is set to 4 ( 1 <= relativeSpeed <= 6)
    );
  }
}
