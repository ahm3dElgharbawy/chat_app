import 'package:chat_app/core/common_widgets/buttons/elevated_button.dart';
import 'package:chat_app/core/constants/image_strings.dart';
import 'package:chat_app/core/constants/routes.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/core/extensions/toast.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/do_not_have_account.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/login_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is LoginSuccess) {
                    "user logged in successfully".showAsToast();
                    context.pushReplacementAllNamed(AppRoutes.layout);
                  } else if (state is LoginFailure) {
                    state.errMessage.showAsToast(Colors.red);
                  }
                },
                builder: (context, state) {
                  return CustomElevatedButton(
                    title: "Log In",
                    isLoading: state is LoginLoading,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthCubit>().login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                      }
                    },
                  );
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
