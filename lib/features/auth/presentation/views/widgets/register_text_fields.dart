import 'package:chat_app/core/common_widgets/text_fields/password_text_field.dart';
import 'package:chat_app/core/common_widgets/text_fields/text_field.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:flutter/material.dart';

class RegisterTextFields extends StatelessWidget {
  const RegisterTextFields({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.phoneController,
  });
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController phoneController;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: nameController,
          label: "enter your name",
          hint: "your name",
          prefix: const Icon(Icons.person),
        ),
        AppSizes.h20,
        CustomTextField(
          controller: emailController,
          label: "enter your email",
          hint: "your email",
          prefix: const Icon(Icons.email),
          keyboardType: TextInputType.emailAddress,
        ),
        AppSizes.h20,
        CustomTextField(
          controller: phoneController,
          label: "enter your phone",
          hint: "your phone",
          prefix: const Icon(Icons.mobile_friendly),
          keyboardType: TextInputType.phone,
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
