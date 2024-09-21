import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

abstract class CustomDropdownMenuTheme {
  static DropdownMenuThemeData lightDropdownMenuTheme = DropdownMenuThemeData(
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyles.medium14.copyWith(color: Colors.grey),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: const BorderSide(color: Colors.red),
      ),
    ),
    textStyle: TextStyles.regular14,
    menuStyle: MenuStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    ),
  );
}
