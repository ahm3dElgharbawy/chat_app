import 'package:chat_app/core/helpers/validator.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

class CustomPasswordTextField extends StatefulWidget{
  const CustomPasswordTextField({super.key, this.hint, this.controller, this.passwordToConfirmController});
  final String? hint;
  final TextEditingController? controller;
  final TextEditingController? passwordToConfirmController;
  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> with Validator {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: isHidden,
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: TextStyles.medium14.copyWith(color: Colors.grey),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        errorMaxLines: 2,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        prefixIcon:  const Icon(Icons.lock),
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              isHidden = !isHidden;
            });
          },
          child: Icon(
            isHidden ? Icons.visibility_off : Icons.visibility,
            color: AppColors.darkThree,
          ),
        ),
      ),
      validator: (password) {
        if(widget.passwordToConfirmController != null){ //? to validate password confirmation
          return validateConfirmPassword(password, widget.passwordToConfirmController!.text);
        }
        return validatePassword(password);
      },
    );
  }
}
