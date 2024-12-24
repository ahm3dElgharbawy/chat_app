import 'package:chat_app/features/auth/data/models/app_user.dart';
import 'package:chat_app/features/chats/presentation/view_models/chats_cubit/chats_cubit.dart';
import 'package:chat_app/features/groups/presentation/views/widgets/create_group_body.dart';
import 'package:chat_app/features/groups/presentation/views/widgets/create_group_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateGroupScreen extends StatelessWidget {
  const CreateGroupScreen({super.key});
  static const routeName = "/createGroup";
  @override
  Widget build(BuildContext context) {
    final TextEditingController groupNameController = TextEditingController();
    List<String> selectedMembers = [AppUser.getFromCache().id];
    context.read<ChatsCubit>().getContacts();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create New Group"),
      ),
      floatingActionButton: CreateGroupButton(
        selectedMembers: selectedMembers,
        groupName: groupNameController,
      ),
      body: CreateGroupBody(
        groupNameController: groupNameController,
        selectedMembers: selectedMembers,
      ),
    );
  }
}
