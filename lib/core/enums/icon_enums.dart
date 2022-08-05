import 'package:flutter/material.dart';

enum IconsEnums { logo, messenger }

extension ImageEnumsExtension on IconsEnums {
  String get _path => 'assets/icons/$name.png';

  Image get toImage => Image.asset(_path);
}
