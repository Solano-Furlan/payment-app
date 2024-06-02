import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF1D275A);
  static const Color background = Color.fromARGB(255, 242, 238, 238);
  static const Color onBackground = Colors.black;
  static const Color lightGreen = Color.fromRGBO(216, 241, 202, 1);
  static const Color green = Color.fromRGBO(125, 209, 77, 1);
  static const Color darkGreen = Color.fromRGBO(158, 233, 114, 1);
  static const Color darkGreen2 = Color.fromRGBO(63, 105, 39, 1);
  static const Color red = Color.fromRGBO(255, 0, 46, 1);
  static const Color border = Color.fromRGBO(186, 186, 186, 1);
  static const Color borderSecondary = Color.fromRGBO(46, 46, 46, 1);
  static const Color grey = Color.fromRGBO(104, 100, 100, 1);
  static const Color textDisabled = Color.fromRGBO(118, 118, 118, 1);
  static const Color white = Colors.white;
  static const Color black = Color.fromRGBO(17, 17, 17, 1);
  static const Color dark1 = Color.fromRGBO(67, 67, 67, 1);
  static const Color dark2 = Color.fromRGBO(115, 112, 113, 1);
  static const Color dark3 = Color.fromRGBO(226, 221, 221, 1);

  static MaterialColor primarySwatch = MaterialColor(
    primary.value,
    const {
      50: primary,
      100: primary,
      200: primary,
      300: primary,
      400: primary,
      500: primary,
      600: primary,
      700: primary,
      800: primary,
      900: primary,
    },
  );
}
