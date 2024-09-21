import 'package:chat_app/core/extensions/size_extensions.dart';
import 'package:flutter/material.dart';

class AppSizes {
  AppSizes._internal();
  static const double defaultSpace = 16;
  static const double spaceBtwItems = 16.0;
  static const double spaceBtwSections = 32.0;
  static const double spaceBtwTextFields = 20;

  // Padding and margin sizes
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 16.0;
  static const double lg = 24.0;
  static const double xl = 32.0;

  // Icon sizes
  static const double iconXs = 12.0;
  static const double iconSm = 16.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;

  static SizedBox get smHeight => SizedBox(height: 16.h);
  static SizedBox get mdHeight => SizedBox(height: 20.h);
  static SizedBox get lgHeight => SizedBox(height: 32.h);
  static SizedBox get xsWidth => const SizedBox(width: xs);
  static SizedBox get smWidth => SizedBox(width: 16.h);
  static SizedBox get mdWidth => SizedBox(width: 20.h);
  static SizedBox get lgWidth => SizedBox(width: 32.h);
}
