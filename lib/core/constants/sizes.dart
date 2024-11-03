import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:flutter/material.dart';

class AppSizes {
  AppSizes._internal();
  static const double defaultSpace = 16;
  static const double spaceBtwItems = 16.0;
  static const double spaceBtwSections = 32.0;
  static const double spaceBtwTextFields = 20;
  // ======================================
  // icon sizes
  // ======================================
  static const double iconXs = 12.0;
  static const double iconSm = 16.0;
  static const double iconMd = 24.0;
  static const double iconLg = 32.0;
  // ======================================
  // vertical spaces
  // ======================================
  static SizedBox get h5 => SizedBox(height: 5.h);
  static SizedBox get h10 => SizedBox(height: 10.h);
  static SizedBox get h15 => SizedBox(height: 15.h);
  static SizedBox get h20 => SizedBox(height: 20.h);
  static SizedBox get h25 => SizedBox(height: 25.h);
  static SizedBox get h30 => SizedBox(height: 30.h);
  static SizedBox get h40 => SizedBox(height: 40.h);
  // ======================================
  // horizontal spaces
  // ======================================
  static SizedBox get w4 => SizedBox(width: 4.w);
  static SizedBox get w5 => SizedBox(width: 5.w);
  static SizedBox get w6 => SizedBox(width: 6.w);
  static SizedBox get w10 => SizedBox(width: 10.w);
  static SizedBox get w15 => SizedBox(width: 15.w);
  static SizedBox get w20 => SizedBox(width: 20.w);
  static SizedBox get w25 => SizedBox(width: 25.w);
  static SizedBox get w30 => SizedBox(width: 30.w);
}
