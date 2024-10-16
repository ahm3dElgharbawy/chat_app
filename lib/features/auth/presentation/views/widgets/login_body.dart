import 'package:chat_app/core/common_widgets/buttons/elevated_button.dart';
import 'package:chat_app/core/constants/image_strings.dart';
import 'package:chat_app/core/constants/routes.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/do_not_have_account.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/login_text_fields.dart';
import 'package:chat_app/features/chats/presentation/views/chats_screen.dart';
import 'package:chat_app/features/layout/presentation/views/main_layout.dart';
import 'package:flutter/material.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.defaultSpace),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //? Login logo
              Image.asset(
                ImageStrings.logo,
                width: 200,
              ),
      
              //? Login title
              Text("Log in to your account", style: TextStyles.bold48),
              AppSizes.h40,
              
              //? Login text fields
              LoginTextFields(
                emailController: emailController,
                passwordController: passwordController,
              ),
              AppSizes.h40,
      
              //? Login button
              CustomElevatedButton(
                title: "Log In",
                onTap: () {
                  // if(formKey.currentState!.validate()){}
                  context.pushReplacementAllNamed(AppRoutes.layout);
                },
              ),
              AppSizes.h40,
      
              //? Don't have account
              const DoNotHaveAccount()
            ],
          ),
        ),
      ),
    );
  }
}
