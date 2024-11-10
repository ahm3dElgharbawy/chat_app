// show flutter toast directly from string
import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension CustomToast on String {
  void showAsToast([
    Color color = Colors.green,
    ToastGravity gravity = ToastGravity.BOTTOM,
  ]) {
    Fluttertoast.showToast(
      msg: this,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0.r,
    );
  }
}
