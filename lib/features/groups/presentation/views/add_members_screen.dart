import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/features/chats/data/models/sender.dart';
import 'package:chat_app/features/chats/presentation/view_models/chats_cubit/chats_cubit.dart';
import 'package:chat_app/features/groups/presentation/views/widgets/add_members_button.dart';
import 'package:chat_app/features/groups/presentation/views/widgets/selectable_group_contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMembersScreen extends StatefulWidget {
  const AddMembersScreen({super.key});
  static String routeName = "/addMembers";

  @override
  State<AddMembersScreen> createState() => _AddMembersScreenState();
}

class _AddMembersScreenState extends State<AddMembersScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ChatsCubit>().getContacts();
  }

  @override
  Widget build(BuildContext context) {
    List<String> selectedMembers = [];
    ChatHeader header = context.args();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add members"),
      ),
      floatingActionButton: AddMembersButton(
        selectedMembers: selectedMembers,
        chatId: header.id,
      ),
      body: Column(
        children: [
          SelectableGroupContacts(
            selectedMembers: selectedMembers,
            exclude: header.members!, // ignore showing original members from the list
          ),
        ],
      ),
    );
  }
}
