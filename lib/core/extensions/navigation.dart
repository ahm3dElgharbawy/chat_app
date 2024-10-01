import 'package:flutter/material.dart';

extension CustomNavigation on BuildContext {
  void pop() {
    Navigator.pop(
      this,
    );
  }

  void pushNamed(String routeName, [Object? args]) {
    Navigator.of(this).pushNamed(routeName, arguments: args);
  }

  void push(Widget screen, [Object? args]) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => screen));
  }

  void pushReplacementNamed(String routeName) {
    Navigator.of(this).pushReplacementNamed(routeName);
  }

  void pushReplacementAllNamed(String routeName) {
    Navigator.of(this).pushNamedAndRemoveUntil(routeName, (route) => false);
  }
}
