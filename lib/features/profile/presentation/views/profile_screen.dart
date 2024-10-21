import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/profile/presentation/views/widgets/profile_body.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile", style: TextStyles.medium48),
      ),
      body: const ProfileBody()
    );
  }
}
