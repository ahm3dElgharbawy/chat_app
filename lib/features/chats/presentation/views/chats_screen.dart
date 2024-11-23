import 'dart:developer';

import 'package:chat_app/features/auth/data/models/app_user.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/chats_body.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    log(AppUser.getFromCache().toJson().toString());
    return const ChatsBody();
  }
}
