import 'package:flutter/material.dart';

class LocalizationManager {
  final List<Locale> supportedLocales = [
    const Locale('en', 'US'),
    const Locale('tr', 'TR')
  ];
  final String localizationPath = 'assets/translations';

  static LocalizationManager? _instance;
  static LocalizationManager get instance {
    if (_instance != null) return _instance!;

    _instance = LocalizationManager._init();
    return _instance!;
  }

  LocalizationManager._init();

  Locale getStartLocale() => const Locale('en', 'US');
  // Locale getStartLocale() => const Locale('tr', 'TR');
  Locale getFallbackLocale() => const Locale('en', 'US');
}
