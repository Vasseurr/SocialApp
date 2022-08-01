import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum LottiePathEnum { SUNNY, MOON }

extension LottiePathEnumExtension on LottiePathEnum {
  String get lottieValue {
    switch (this) {
      case LottiePathEnum.SUNNY:
        return _pathValue('sun');
      case LottiePathEnum.MOON:
        return _pathValue('moon');
    }
  }

  //TODO: add parameter for height and width
  Widget get toWidget => Lottie.asset(lottieValue);

  String _pathValue(String path) => 'assets/lottie/$path.json';
}
