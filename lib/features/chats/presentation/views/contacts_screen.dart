import 'package:chat_app/features/auth/data/models/app_user.dart';
import 'package:chat_app/features/chats/presentation/view_models/chats_cubit/chats_cubit.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/contacts_body.dart';
import 'package:chat_app/features/layout/presentation/views/widgets/main_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});
  static const routeName = "/contacts";
  @override
  Widget build(BuildContext context) {
    context.read<ChatsCubit>().getContacts();
    print(AppUser.getFromCache().id);
    return  Scaffold(
      appBar: AppBar(title: const Text("Contacts"),),
      body: const ContactsBody(),
    );
  }
}