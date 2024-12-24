import 'package:chat_app/core/common_widgets/buttons/floating_action_button.dart';
import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/features/chats/presentation/views/contacts_screen.dart';
import 'package:flutter/material.dart';

class ShowContactsButtons extends StatelessWidget {
  const ShowContactsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFloatingActionButton(
      onTap: () {
        context.pushNamed(ContactsScreen.routeName);
      },
      icon: Icons.chat,
    );
  }
}


