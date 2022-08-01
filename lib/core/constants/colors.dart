// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class MyColors {
  static const MaterialColor colorPrimary = MaterialColor(
    0xFF189fd7,
    <int, Color>{
      50: Color(0xFF189fd7),
      100: Color(0xFF189fd7),
      200: Color(0xFF189fd7),
      300: Color(0xFF189fd7),
      400: Color(0xFF189fd7),
      500: Color(0xFF189fd7),
      600: Color(0xFF189fd7),
      700: Color(0xFF189fd7),
      800: Color(0xFF189fd7),
      900: Color(0xFF189fd7),
    },
  );

  static const MaterialColor colorPrimarySwitch = MaterialColor(
    0xFF25aae1,
    <int, Color>{
      50: Color(0xFF25aae1),
      100: Color(0xFF25aae1),
      200: Color(0xFF25aae1),
      300: Color(0xFF25aae1),
      400: Color(0xFF25aae1),
      500: Color(0xFF25aae1),
      600: Color(0xFF25aae1),
      700: Color(0xFF25aae1),
      800: Color(0xFF25aae1),
      900: Color(0xFF25aae1),
    },
  );

  //* SnackBar colors
  static const snackBar_error = Color(0xFFED2E7E);
  static const snackBar_error_background = Color(0xFFfdeaf2);
  static const snackBar_success = Color(0xFF00BA88);
  static const snackBar_success_background = Color(0xFFe6f8f3);
  static const snackBar_info = Color(0xFF3394F6);
  static const snackBar_info_background = Color(0xFFebf4fe);

  //* Alert dialog
  static const dialog_title = Color(0xFF1A1D1E);
  static const dialog_content = Color(0xFF6A6A6A);
  static const dialog_confirm_button_background =
      Color.fromRGBO(17, 111, 254, 1);
  static final dialog_cancel_text = Colors.blue.shade500;

  //* Appbar
  static const primaryBlueColor = Color.fromARGB(255, 137, 65, 220);
  static const primaryGreenColor = Color.fromARGB(255, 35, 32, 219);
  static const List<Color> primaryColorList = [
    primaryBlueColor,
    primaryGreenColor
  ];

  //* Main colors
  static const mainButtonColor = Color.fromARGB(255, 44, 42, 135);

  //* Bottom Nav Bar
  static const Color selectedTabIndexColor = Color.fromARGB(255, 0, 0, 0);
  static const Color unSelectedTabIndexColor = Color.fromARGB(255, 85, 79, 79);
}
