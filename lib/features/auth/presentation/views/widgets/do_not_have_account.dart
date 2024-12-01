import 'package:chat_app/core/constants/routes.dart';
import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/auth/presentation/views/register_screen.dart';
import 'package:flutter/material.dart';

class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don’t have an account?", style: TextStyles.bold14),
        TextButton(
          onPressed: () {
            context.pushReplacementNamed(RegisterScreen.routeName);
          },
          child: Text(
            "Register here",
            style: TextStyles.bold14.copyWith(color: AppColors.primary),
          ),
        )
      ],
    );
  }
}
