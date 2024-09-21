import 'package:chat_app/core/themes/colors.dart';
import 'package:flutter/material.dart';

abstract class CustomRadioButtonTheme {
  static RadioThemeData lightRadioButtonTheme = RadioThemeData(
    fillColor: WidgetStateColor.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.secondary;
      }
      return Colors.grey;
    }),
  );
}
