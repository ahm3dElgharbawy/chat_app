import 'package:chat_app/core/common_widgets/buttons/elevated_button.dart';
import 'package:chat_app/core/constants/image_strings.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/already_have_account.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/do_not_have_account.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/register_text_fields.dart';
import 'package:flutter/material.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final phoneController = TextEditingController();
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
              Text("Register to new account", style: TextStyles.bold48),
              AppSizes.h40,
              
              //? Login text fields
              RegisterTextFields(
                nameController: nameController,
                emailController: emailController,
                phoneController: phoneController,
                passwordController: passwordController,
              ),
              AppSizes.h40,
      
              //? Login button
              CustomElevatedButton(
                title: "Sign Up",
                onTap: () {
                  if(formKey.currentState!.validate()){
                    // register
                  }
                },
              ),
              AppSizes.h40,
      
              //? already have an account
              const AlreadyHaveAnAccount()
            ],
          ),
        ),
      ),
    );
  }
}
