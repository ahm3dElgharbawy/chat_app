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

  // height
  static final h5 = SizedBox(height: 5.h);
  static final h10 = SizedBox(height: 10.h);
  static final h15 = SizedBox(height: 15.h);
  static final h20 = SizedBox(height: 20.h);
  static final h25 = SizedBox(height: 25.h);
  static final h30 = SizedBox(height: 30.h);
  // width
  static final w4 = SizedBox(width: 4.w);
  static final w5 = SizedBox(width: 5.w);
  static final w6 = SizedBox(width: 6.w);
  static final w10 = SizedBox(width: 10.w);
  static final w15 = SizedBox(width: 15.w);
  static final w20 = SizedBox(width: 20.w);
  static final w25 = SizedBox(width: 25.w);
  static final w30 = SizedBox(width: 30.w);
}
