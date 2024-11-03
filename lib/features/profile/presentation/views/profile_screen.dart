import 'package:chat_app/core/common_widgets/buttons/icon_button.dart';
import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/profile/presentation/views/widgets/profile_body.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: kToolbarHeight.r,
          title: Text("Profile", style: TextStyles.medium24),
          leading: CustomIconButton(
            icon: Icon(Icons.arrow_back, size: 24.r),
            onTap: () => context.pop(),
          ),
          leadingWidth: 50.w,
        ),
        body: const ProfileBody());
  }
}
