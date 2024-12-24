import 'package:chat_app/core/common_widgets/buttons/floating_action_button.dart';
import 'package:chat_app/core/common_widgets/loading_dialog.dart';
import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/core/extensions/toast.dart';
import 'package:chat_app/features/groups/presentation/view_models/group_cubit/group_cubit.dart';
import 'package:chat_app/features/layout/presentation/views/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddMembersButton extends StatelessWidget {
  const AddMembersButton({
    super.key,
    required this.selectedMembers,
    required this.chatId,
  });
  final List<String> selectedMembers;
  final String chatId;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GroupCubit, GroupState>(
      listener: (context, state) {
        if (state is AddGroupMemberSuccess) {
          "${selectedMembers.length == 1 ? "Member" : "Members"} added successfully"
              .showAsToast();
          context.pushReplacementAllNamed(MainLayout.routeName);
        } else if (state is AddGroupMemberLoading) {
          showDialog(
            context: context,
            barrierDismissible:
                false, // ignoring dispose the dialog on tapping outside
            builder: (context) => const CustomLoadingDialog(),
          );
        }
      },
      builder: (context, state) => CustomFloatingActionButton(
        onTap: () {
          if (state is! AddGroupMemberLoading && selectedMembers.isNotEmpty) {
            context.read<GroupCubit>().addMember(chatId, selectedMembers);
          }
        },
        icon: Icons.done,
      ),
    );
  }
}
