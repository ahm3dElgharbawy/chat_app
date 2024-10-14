import 'package:chat_app/core/common_widgets/text_fields/password_text_field.dart';
import 'package:chat_app/core/common_widgets/text_fields/text_field.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class LoginTextFields extends StatelessWidget {
  const LoginTextFields({
    super.key,
    required this.emailController,
    required this.passwordController,
  });
  final TextEditingController emailController;
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: emailController,
          label: "enter your email",
          hint: "your email",
          prefix: const Icon(Icons.email),
          keyboardType: TextInputType.emailAddress,
        ),
        AppSizes.h20,
        CustomPasswordTextField(
          controller: passwordController,
          label: "enter your password",
          hint: "your password",
        ),
      ],
    );
  }
}
