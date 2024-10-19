import 'package:chat_app/core/common_widgets/buttons/elevated_button.dart';
import 'package:chat_app/core/common_widgets/text_fields/text_field.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/profile/presentation/views/widgets/profile_avatar.dart';
import 'package:chat_app/features/profile/presentation/views/widgets/profile_text_fields.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: "Ahmed elsafy");
    final phoneController = TextEditingController(text: "01028365306");
    final formKey = GlobalKey<FormState>();
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSizes.defaultSpace),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomProfileAvatar(),
            AppSizes.h40,
            const Divider(
              color: Colors.grey,
            ),
            AppSizes.h40,
            //? user data
            ProfileTextFields(
              nameController: nameController,
              phoneController: phoneController,
            ),
            AppSizes.h40,

            CustomElevatedButton(
              title: "Save Profile",
              prefix: const Icon(Icons.save,color: Colors.white),
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
