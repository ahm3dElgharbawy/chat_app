import 'package:chat_app/core/extensions/size_extensions.dart';
import 'package:flutter/material.dart';

class DeviceUtils extends StatelessWidget {
  final Widget desktop;
  final Widget? tablet;
  final Widget mobile;

  const DeviceUtils(
      {super.key, required this.desktop, this.tablet, required this.mobile});

  static bool isMobile(BuildContext context) => context.screenWidth < 750;
  static bool isTablet(BuildContext context) =>
      context.screenWidth >= 750 && context.screenWidth < 1200;
  static bool isDesktop(BuildContext context) => context.screenWidth >= 1200;
  static bool isDesktopWithoutDrawer(BuildContext context) =>
      context.screenWidth >= 1600;

  static T valueDecider<T>(BuildContext context,
      {required T onMobile, T? onTablet, T? onDesktop, T? others}) {
    if (isMobile(context)) {
      return onMobile;
    } else if (isTablet(context) && onTablet != null) {
      return onTablet;
    } else if (isDesktop(context) && onDesktop != null) {
      return onDesktop;
    } else {
      return others ?? onMobile;
    }
  }

  @override
  Widget build(Object context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1200) {
        return desktop;
      } else if (constraints.maxWidth >= 800) {
        return tablet ?? desktop;
      } else {
        return mobile;
      }
    });
  }
}
