import 'package:chat_app/core/common_widgets/buttons/elevated_button.dart';
import 'package:chat_app/core/constants/image_strings.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/core/extensions/toast.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/auth/data/models/app_user.dart';
import 'package:chat_app/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:chat_app/features/auth/presentation/views/login_screen.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/already_have_account.dart';
import 'package:chat_app/features/auth/presentation/views/widgets/register_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
              //? register logo
              Image.asset(
                ImageStrings.logo,
                width: 200.h,
              ),

              //? register title
              Text("Register to new account", style: TextStyles.bold24),
              AppSizes.h30,

              //? register text fields
              RegisterTextFields(
                nameController: nameController,
                emailController: emailController,
                phoneController: phoneController,
                passwordController: passwordController,
              ),
              AppSizes.h30,

              //? register button
              BlocConsumer<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is RegisterSuccess) {
                    "account created successfully".showAsToast();
                    context.pushReplacementNamed(LoginScreen.routeName);
                  } else if (state is RegisterFailure) {
                    state.errMessage.showAsToast(Colors.red);
                  }
                },
                builder: (context, state) {
                  return CustomElevatedButton(
                    title: "Sign Up",
                    isLoading: state is RegisterLoading,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthCubit>().register(
                              AppUser(
                                id: '',
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                phone: phoneController.text,
                              ),
                            );
                      }
                    },
                  );
                },
              ),
              AppSizes.h30,

              //? already have an account
              const AlreadyHaveAnAccount()
            ],
          ),
        ),
      ),
    );
  }
}
