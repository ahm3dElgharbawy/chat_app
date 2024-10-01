import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/helpers/validator.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget with Validator {
  const CustomTextField(
      {super.key,
      this.hint,
      this.label,
      this.controller,
      this.prefix,
      this.keyboardType = TextInputType.text,
      this.fillColor,
      this.suffix,
      this.maxLines = 1,
      this.minLines = 1,
      this.onTap,
      this.readOnly = false,
      this.border,
      this.contentPadding,
      this.expands = false,
      this.onChanged});
  final String? hint;
  final String? label;
  final TextEditingController? controller;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType keyboardType;
  final Color? fillColor;
  final int? maxLines;
  final int? minLines;
  final bool readOnly;
  final VoidCallback? onTap;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;
  final bool expands;
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
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: prefix,
        suffixIcon: suffix,
        fillColor: fillColor,
        label: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Text("$label"),
        ),
        border: border,
        hintStyle: TextStyles.medium14.copyWith(color: Colors.grey),
        enabledBorder: border,
        focusedBorder: border,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(
              horizontal: AppSizes.md,
              vertical: AppSizes.md,
            ),
      ),
      validator: (value) {
        if (keyboardType == TextInputType.emailAddress) {
          return validateEmail(value);
        } else {
          return validateRequiredField(value, label);
        }
      },
    );
  }
}
