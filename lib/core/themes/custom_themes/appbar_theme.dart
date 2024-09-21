import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

abstract class CustomAppBarTheme {
  static AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: Colors.transparent,
    foregroundColor: Colors.black,
    elevation: 0,
    titleTextStyle: TextStyles.medium26,
  );
}
