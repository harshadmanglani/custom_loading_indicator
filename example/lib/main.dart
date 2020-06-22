import 'package:flutter/material.dart';
import 'package:custom_loading_indicator/custom_loading_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

// CHECK LINES 49 AND 53 FOR THE SAMPLE IMPLEMENTATIONS
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/CustomCircularExample': (BuildContext context) =>
              CustomCircularExample(),
          '/CustomFadeExample': (BuildContext context) => CustomFadeExample()
        },
        home: Builder(
          builder: (context) => Container(
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
              )
            ],
          )),
        ));
  }
}

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
    );
  }
}
