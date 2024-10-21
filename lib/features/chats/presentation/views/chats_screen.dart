import 'package:chat_app/core/common_widgets/contact_card.dart';
import 'package:chat_app/core/common_widgets/main_appbar.dart';
import 'package:chat_app/core/constants/image_strings.dart';
import 'package:chat_app/core/constants/routes.dart';
import 'package:chat_app/core/enums/media_type.dart';
import 'package:chat_app/core/enums/seen_status.dart';
import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/chats_body.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.chat),
      ),
      body: const ChatsBody()
    );
  }
}
