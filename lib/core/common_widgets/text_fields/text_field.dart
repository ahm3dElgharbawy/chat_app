import 'package:chat_app/core/helpers/validator.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget with Validator {
  const CustomTextField({
    super.key,
    this.hint,
    this.label,
    this.controller,
    this.prefix,
    this.keyboardType = TextInputType.text,
    this.suffix,
    this.maxLines = 1,
    this.minLines = 1,
    this.onTap,
    this.isRequired = true,
    this.readOnly = false,
    this.expands = false,
    this.obscureText  = false,
    this.onChanged, this.validator,
  });
  final String? hint;
  final String? label;
  final TextEditingController? controller;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType keyboardType;
  final int? maxLines;
  final int? minLines;
  final bool readOnly;
  final VoidCallback? onTap;
  final bool expands;
  final bool isRequired;
  final bool obscureText;
  final FormFieldValidator? validator;
  final Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      minLines: minLines,
      maxLines: maxLines,
      onTap: onTap,
      readOnly: readOnly,
      onChanged: onChanged,
      onTapOutside: (event) {
        // FocusScope.of(context).unfocus();
      },
      obscureText: obscureText,
      style: const TextStyle(fontSize: 16),
      
      decoration: InputDecoration(
        label: label != null ? Text("$label") : null,
        hintText: hint,
        hintStyle: TextStyles.regular34.copyWith(color: Colors.grey),
        prefixIcon: prefix,
        suffixIcon: suffix,
        filled: true,
        fillColor: Colors.white,
        errorMaxLines: 2,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xffB9BCB3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xffB9BCB3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      validator: validator ?? (value) {
              if (!isRequired) {
                return null;
              } else if (keyboardType == TextInputType.emailAddress) {
                return validateEmail(value);
              } else {
                return validateRequiredField(value, hint);
              }
            },
    );
  }
}
