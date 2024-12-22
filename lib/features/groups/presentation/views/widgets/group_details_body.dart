import 'package:chat_app/core/common_widgets/circular_image.dart';
import 'package:chat_app/core/common_widgets/loading_widget.dart';
import 'package:chat_app/core/common_widgets/user_contact_card.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/chats/data/models/sender.dart';
import 'package:chat_app/features/groups/presentation/view_models/group_cubit/group_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupDetailsBody extends StatelessWidget {
  const GroupDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    ChatHeader chatHeader = context.args();

    return SingleChildScrollView(
      child: Column(
        children: [
          Hero(
            tag: chatHeader.id,
            child: CustomCircularImage(
              image: chatHeader.avatar,
              size: 100.r,
            ),
          ),
          AppSizes.h10,
          Text(
            chatHeader.name,
            style: TextStyles.bold22,
          ),
          AppSizes.h10,
          Text("Group . ${chatHeader.members!.length} members",
              style: TextStyles.regular14),
          AppSizes.h20,
          ListTile(
            onTap: () {},
            title: const Text("Add Members"),
            leading: Container(
              height: 50.r,
              width: 50.r,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
              child: Icon(
                Icons.person_add_alt_rounded,
                size: 26.r,
                color: Colors.white,
              ),
            ),
          ),
          BlocBuilder<GroupCubit, GroupState>(
            builder: (context, state) {
              if (state is GetGroupMembersLoading) {
                return const CustomLoadingWidget();
              }
              return Column(
                children: [
                  ...context.read<GroupCubit>().groupMembers.map(
                        (member) => UserContactCard(user: member),
                      )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
