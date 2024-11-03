import 'package:chat_app/core/common_widgets/buttons/elevated_button.dart';
import 'package:chat_app/core/constants/image_strings.dart';
import 'package:chat_app/core/constants/routes.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/do_not_have_account.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/login_text_fields.dart';
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
        padding: EdgeInsets.all(AppSizes.defaultSpace.r),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //? Login logo
              Image.asset(
                ImageStrings.logo,
                height: 200.h,
              ),
      
              //? Login title
              Text("Log in to your account", style: TextStyles.bold24),
              AppSizes.h30,
              
              //? Login text fields
              LoginTextFields(
                emailController: emailController,
                passwordController: passwordController,
              ),
              AppSizes.h30,

              //? Login button
              CustomElevatedButton(
                title: "Log In",
                onTap: () {
                  // if(formKey.currentState!.validate()){}
                  context.pushReplacementAllNamed(AppRoutes.layout);
                },
              ),
              AppSizes.h30,
      
              //? Don't have account
              const DoNotHaveAccount()
            ],
          ),
        ),
      ),
    );
  }
}
