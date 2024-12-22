import 'package:chat_app/core/common_widgets/circular_container.dart';
import 'package:chat_app/core/common_widgets/circular_image.dart';
import 'package:chat_app/core/common_widgets/user_contact_card.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/extensions/navigation.dart';

import 'package:chat_app/features/chats/data/models/sender.dart';
import 'package:chat_app/features/groups/presentation/view_models/group_cubit/group_cubit.dart';
import 'package:chat_app/features/groups/presentation/views/widgets/group_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupDetailsScreen extends StatefulWidget {
  const GroupDetailsScreen({super.key});
  static const routeName = "/groupDetails";

  @override
  State<GroupDetailsScreen> createState() => _GroupDetailsScreenState();
}

class _GroupDetailsScreenState extends State<GroupDetailsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<GroupCubit>()
          .fetchGroupMembers((context.args() as ChatHeader).members!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const GroupDetailsBody(),
    );
  }
}
