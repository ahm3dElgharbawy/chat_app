import 'package:chat_app/core/themes/colors.dart';
import 'package:flutter/material.dart';

abstract class CustomSwitchButtonTheme {
  static SwitchThemeData lightSwitchButtonTheme = SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary;
        }
        return Colors.black45;
      },
    ),
    trackColor: WidgetStateProperty.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primary.withOpacity(.5);
        }
        return AppColors.light;
      },
    ),
  );
}
