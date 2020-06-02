# custom_loading_indicator

A Flutter package to customise the loading indicators with your organisation's logo.

Let's say you're a dentist and your app has the standard circular loading indicator. If you want to try
something new, this is what your customised circular loading indicator would like!

<img src="/customcircularloading.gif" width="350" height="700"/>

## Installing
Depend on it in your pubsec.yaml

```
dependencies:
  custom_loading_indicator: ^0.0.1
```

From your command line, run:
```
flutter pub get
```

## Using the package
Make sure your custom logo/image is an asset in your pubsec.yaml
Once you do that, import the package in your .dart file

```
import 'package:custom_loading_indicator/custom_loading_indicator.dart';
```

You can now use the CustomCircularLoadingIndicator class and customise it with your organisation's logo.