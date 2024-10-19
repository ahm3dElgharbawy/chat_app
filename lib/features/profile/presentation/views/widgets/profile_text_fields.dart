import 'package:chat_app/core/common_widgets/text_fields/text_field.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

class ProfileTextFields extends StatelessWidget {
  const ProfileTextFields({super.key, required this.nameController, required this.phoneController});
  final TextEditingController nameController;
  final TextEditingController phoneController;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Name",
          style: TextStyles.semibold34.copyWith(color: Colors.grey[600]),
        ),
        AppSizes.h10,
        CustomTextField(
          controller: nameController,
          hint: "your name",
        ),
        AppSizes.h15,
        Text(
          "Phone",
          style: TextStyles.semibold34.copyWith(color: Colors.grey[600]),
        ),
        AppSizes.h10,
        CustomTextField(
          controller: phoneController,
          keyboardType: TextInputType.phone,
          hint: "your phone",
        ),
      ],
    );
  }
}
