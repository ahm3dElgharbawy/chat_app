import 'package:chat_app/core/common_widgets/loading_dialog.dart';
import 'package:chat_app/core/common_widgets/loading_widget.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/core/extensions/toast.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/chats/data/models/sender.dart';
import 'package:chat_app/features/chats/presentation/view_models/chats_cubit/chats_cubit.dart';
import 'package:chat_app/features/groups/presentation/view_models/group_cubit/group_cubit.dart';
import 'package:chat_app/features/groups/presentation/views/widgets/selectable_group_contacts.dart';
import 'package:chat_app/features/layout/presentation/views/main_layout.dart';
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
    List<String> membersIds = [];
    ChatHeader header = context.args();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add members"),
      ),
      floatingActionButton: BlocConsumer<GroupCubit, GroupState>(
        listener: (context, state) {
          if (state is AddGroupMemberSuccess) {
            "Members added successfully".showAsToast();
            context.pushReplacementAllNamed(MainLayout.routeName);
          } else if (state is AddGroupMemberLoading) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => const CustomLoadingDialog(),
            );
          }
        },
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () {
              if (state is! AddGroupMemberLoading && membersIds.isNotEmpty) {
                context.read<GroupCubit>().addMember(header.id, membersIds);
              }
            },
            backgroundColor: AppColors.primary,
            child: const Icon(Icons.done),
          );
        },
      ),
      body: Column(
        children: [
          SelectableGroupContacts(
            membersIds: membersIds,
            exclude: header.members!, // 
          ),
        ],
      ),
    );
  }
}
