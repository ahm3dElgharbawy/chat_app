import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/custom_themes/appbar_theme.dart';
import 'package:chat_app/core/themes/custom_themes/dropdown_menu_theme.dart';
import 'package:chat_app/core/themes/custom_themes/elevated_button_theme.dart';
import 'package:chat_app/core/themes/custom_themes/input_theme.dart';
import 'package:chat_app/core/themes/custom_themes/radio_button_theme.dart';
import 'package:chat_app/core/themes/custom_themes/switch_button_theme.dart';
import 'package:flutter/material.dart';

abstract class AppThemes {
  static final light = ThemeData(
    fontFamily: "Inter",
    useMaterial3: false,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      primary: AppColors.primary,
    ),
    brightness: Brightness.light,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: AppColors.primary),
    radioTheme: CustomRadioButtonTheme.lightRadioButtonTheme,
    inputDecorationTheme: CustomInputDecorationTheme.lightInputDecorationTheme,
    dropdownMenuTheme: CustomDropdownMenuTheme.lightDropdownMenuTheme,
    switchTheme: CustomSwitchButtonTheme.lightSwitchButtonTheme
  );
}
