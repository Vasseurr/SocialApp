import 'package:flutter/material.dart';

enum ImageEnums { logo, messenger }

extension ImageEnumsExtension on ImageEnums {
  String get path => 'assets/images/$name.png';

  Image get toImage => Image.asset(path);
}
