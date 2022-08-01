import 'package:flutter/cupertino.dart';

class CustomPadding {
  static CustomPadding? _instance;

  static CustomPadding get instance {
    if (_instance != null) return _instance!;

    _instance = CustomPadding._init();
    return _instance!;
  }

  CustomPadding._init();

  Padding allPadding({required double value, required Widget child}) =>
      Padding(padding: EdgeInsets.all(value), child: child);
}
