import 'package:chat_app/core/common_widgets/buttons/floating_action_button.dart';
import 'package:chat_app/core/common_widgets/loading_dialog.dart';
import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/core/extensions/toast.dart';
import 'package:chat_app/features/groups/presentation/view_models/group_cubit/group_cubit.dart';
import 'package:chat_app/features/layout/presentation/views/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CreateGroupButton extends StatelessWidget {
  const CreateGroupButton(
      {super.key, required this.selectedMembers, required this.groupName});
  final List<String> selectedMembers;
  final TextEditingController groupName;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GroupCubit, GroupState>(
      listener: (context, state) {
        if (state is CreateGroupSuccess) {
          "Group created successfully".showAsToast();
          context.pushReplacementAllNamed(MainLayout.routeName);
        } else if (state is CreateGroupLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const CustomLoadingDialog(),
          );
        } else if (state is CreateGroupFailure) {
          state.message.showAsToast(Colors.red);
        }
      },
      builder: (context, state) => CustomFloatingActionButton(
        onTap: () {
          if (selectedMembers.length == 1) {
            "you must select one member at least".showAsToast(Colors.red,ToastGravity.BOTTOM);
          } 
          if (groupName.text.isEmpty) {
            "you must add group name".showAsToast(Colors.red,ToastGravity.BOTTOM);
          } else if (state is! CreateGroupLoading) {
            context.read<GroupCubit>().createGroup(groupName.text, selectedMembers);
          }
        },
        icon: Icons.done,
      ),
    );
  }
}
