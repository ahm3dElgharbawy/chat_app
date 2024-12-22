import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/core/extensions/toast.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/features/auth/data/models/app_user.dart';
import 'package:chat_app/features/chats/presentation/view_models/chats_cubit/chats_cubit.dart';
import 'package:chat_app/features/groups/presentation/view_models/group_cubit/group_cubit.dart';
import 'package:chat_app/features/groups/presentation/views/widgets/create_group_body.dart';
import 'package:chat_app/features/layout/presentation/views/main_layout.dart';
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
      floatingActionButton: BlocConsumer<GroupCubit, GroupState>(
        listener: (context, state) {
          if (state is CreateGroupSuccess) {
            "group created successfully".showAsToast();
            context.pushReplacementAllNamed(MainLayout.routeName);
          } else if (state is CreateGroupFailure) {
            state.message.showAsToast(Colors.red);
          }
        },
        builder: (context, state) => FloatingActionButton(
          onPressed: () {
            if (selectedMembers.length == 1) {
              "you must add one member at least".showAsToast(Colors.red);
            } else if (state is! CreateGroupLoading) {
              context
                  .read<GroupCubit>()
                  .createGroup(groupNameController.text, selectedMembers);
            }
          },
          backgroundColor: AppColors.primary,
          child: state is CreateGroupLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : const Icon(Icons.arrow_forward),
        ),
      ),
      body: CreateGroupBody(
        groupNameController: groupNameController,
        membersIds: selectedMembers,
      ),
    );
  }
}
