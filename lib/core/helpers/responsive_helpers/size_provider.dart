import 'package:flutter/material.dart';

class SizedProvider extends InheritedWidget {
  final Size designSize;
  final double height;
  final double width;

  const SizedProvider({
    super.key,
    required super.child,
    required this.designSize,
    required this.height,
    required this.width,
  });

  static SizedProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SizedProvider>()!;
  }

  @override
  bool updateShouldNotify(covariant SizedProvider oldWidget) {
    return designSize != oldWidget.designSize ||
        height != oldWidget.height ||
        width != oldWidget.width ||
        child != oldWidget.child;
  }
}
