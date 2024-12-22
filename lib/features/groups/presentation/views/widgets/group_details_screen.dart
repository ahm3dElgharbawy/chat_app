import 'package:chat_app/core/common_widgets/circular_container.dart';
import 'package:chat_app/core/common_widgets/circular_image.dart';
import 'package:chat_app/core/common_widgets/user_contact_card.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/auth/data/models/app_user.dart';
import 'package:chat_app/features/chats/data/models/sender.dart';
import 'package:chat_app/features/groups/presentation/views/widgets/group_details_body.dart';
import 'package:flutter/material.dart';

class GroupDetailsScreen extends StatefulWidget {
  const GroupDetailsScreen({super.key});
  static const routeName = "/groupDetails";

  @override
  State<GroupDetailsScreen> createState() => _GroupDetailsScreenState();
}

class _GroupDetailsScreenState extends State<GroupDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const GroupDetailsBody()
    );
  }
}
