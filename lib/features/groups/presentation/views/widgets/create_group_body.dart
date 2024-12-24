import 'package:chat_app/core/common_widgets/buttons/icon_button.dart';
import 'package:chat_app/core/common_widgets/section_text.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:chat_app/features/groups/presentation/views/widgets/selectable_group_contacts.dart';
import 'package:flutter/material.dart';

class CreateGroupBody extends StatefulWidget {
  const CreateGroupBody(
      {super.key, required this.selectedMembers, required this.groupNameController});
  final List<String> selectedMembers;
  final TextEditingController groupNameController;
  @override
  State<CreateGroupBody> createState() => _CreateGroupBodyState();
}

class _CreateGroupBodyState extends State<CreateGroupBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace.r),
          child: Row(
            children: [
              CustomIconButton(
                icon: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                ),
                onTap: () {},
                backgroundColor: Colors.grey,
              ),
              AppSizes.w10,
              Expanded(
                child: TextField(
                  autofocus: true,
                  controller: widget.groupNameController,
                  decoration: const InputDecoration(hintText: "group name"),
                ),
              ),
            ],
          ),
        ),
        AppSizes.h20,
        const CustomSectionText(text: "Select group members"),
        AppSizes.h10,
        SelectableGroupContacts(selectedMembers: widget.selectedMembers,)
      ],
    );
  }
}
