import 'package:chat_app/core/common_widgets/circular_image.dart';
import 'package:chat_app/core/common_widgets/loading_widget.dart';
import 'package:chat_app/core/constants/image_strings.dart';
import 'package:chat_app/features/auth/data/models/app_user.dart';
import 'package:chat_app/features/chats/presentation/view_models/chats_cubit/chats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectableGroupContacts extends StatefulWidget {
  const SelectableGroupContacts(
      {super.key, required this.selectedMembers, this.exclude = const []});
  final List<String> selectedMembers;
  final List<String> exclude;

  @override
  State<SelectableGroupContacts> createState() =>
      _SelectableGroupContactsState();
}

class _SelectableGroupContactsState extends State<SelectableGroupContacts> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsCubit, ChatsState>(
      builder: (context, state) {
        if (state is GetContactsLoading) {
          return const CustomLoadingWidget();
        }
        final List<AppUser> contacts = context.read<ChatsCubit>().contacts.where((item) => !widget.exclude.contains(item.id)).toList();
        return Expanded(
          child: ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, i) => ListTile(
              onTap: () {
                if (widget.selectedMembers.contains(contacts[i].id)) {
                  widget.selectedMembers.remove(contacts[i].id);
                } else {
                  widget.selectedMembers.add(contacts[i].id);
                }
                setState(() {});
              },
              trailing: widget.selectedMembers.contains(contacts[i].id)
                  ? const Icon(Icons.check_circle, color: Colors.green)
                  : null,
              leading: const CustomCircularImage(
                image: ImageStrings.user,
                isNetwork: false,
              ),
              title: Text(contacts[i].name),
              subtitle: Text(contacts[i].phone),
            ),
          ),
        );
      },
    );
  }
}
