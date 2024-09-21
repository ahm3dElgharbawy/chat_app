import 'package:flutter/material.dart';

abstract class CustomElevatedButtonTheme {
  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      disabledBackgroundColor: const Color(0xffA4A5A5),
      disabledForegroundColor: const Color(0xffDDDEDE),
    ),
  );
}
