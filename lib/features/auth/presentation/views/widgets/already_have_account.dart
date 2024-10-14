import 'package:chat_app/core/constants/routes.dart';
import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

class AlreadyHaveAnAccount extends StatelessWidget {
  const AlreadyHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?", style: TextStyles.bold28),
        TextButton(
          onPressed: () {
            context.pushReplacementNamed(AppRoutes.login);
          },
          child: Text(
            "Login here",
            style: TextStyles.bold28.copyWith(color: AppColors.primary),
          ),
        )
      ],
    );
  }
}
