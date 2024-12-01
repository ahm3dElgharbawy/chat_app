import 'package:chat_app/features/auth/presentation/views/widgets/login_body.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static const routeName = "/login";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: LoginBody());
  }
}
