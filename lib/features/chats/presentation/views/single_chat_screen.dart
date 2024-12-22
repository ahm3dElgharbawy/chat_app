import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/features/chats/data/models/sender.dart';
import 'package:chat_app/features/chats/presentation/view_models/chats_cubit/chats_cubit.dart';
import 'package:chat_app/features/groups/presentation/views/group_details_screen.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/chat_app_bar.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/single_chat_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleChatScreen extends StatefulWidget {
  const SingleChatScreen({super.key});
  static const routeName = "/singleChat";

  @override
  State<SingleChatScreen> createState() => _SingleChatScreenState();
}

class _SingleChatScreenState extends State<SingleChatScreen> {
  late ChatHeader chatHeader;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      chatHeader = context.args();
      if (chatHeader.isGroup) {
        context.read<ChatsCubit>().getGroupMessages(chatHeader.id);
      } else {
        context.read<ChatsCubit>().getChatMessages(chatHeader.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    chatHeader = context.args();
    return Scaffold(
      appBar: CustomChatAppbar(
        id: chatHeader.id,
        username: chatHeader.name,
        image: chatHeader.avatar,
        onTapTitle: () {
          if (chatHeader.isGroup) {
            context.pushNamed(GroupDetailsScreen.routeName, chatHeader);
          }
        },
      ),
      backgroundColor: const Color(0xffece6df),
      body: const SingleChatBody(),
    );
  }
}
