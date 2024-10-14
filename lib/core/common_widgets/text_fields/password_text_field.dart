import 'package:chat_app/core/common_widgets/text_fields/text_field.dart';
import 'package:chat_app/core/helpers/validator.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:flutter/material.dart';

class CustomPasswordTextField extends StatefulWidget {
  const CustomPasswordTextField({
    super.key,
    this.hint,
    this.controller,
    // this.passwordToConfirmController,
    this.label,
  });
  final String? hint;
  final String? label;
  final TextEditingController? controller;
  // final TextEditingController? passwordToConfirmController;
  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField>
    with Validator {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      hint: widget.hint,
      label: widget.label,
      controller: widget.controller,
      obscureText: isHidden,
      prefix: const Icon(Icons.lock),
      suffix: GestureDetector(
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
      validator: (password) {
        // if (widget.passwordToConfirmController != null) {
        //   //? to validate password confirmation
        //   return validateConfirmPassword(
        //       password, widget.passwordToConfirmController!.text);
        // }
        return validatePassword(password);
      },
    );
  }
}
