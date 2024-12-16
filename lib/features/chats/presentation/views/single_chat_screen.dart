import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/features/chats/data/models/sender.dart';
import 'package:chat_app/features/chats/presentation/view_models/chats_cubit/chats_cubit.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/chat_app_bar.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/single_chat_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleChatScreen extends StatelessWidget {
  const SingleChatScreen({super.key});
  static const routeName = "/singleChat";

  @override
  Widget build(BuildContext context) {
    final UserData user = context.args()['user'];
    context.read<ChatsCubit>().getChatMessages(user.id);
    return Scaffold(
      appBar: CustomChatAppbar(
        username: user.name,
        image: user.avatar,
      ),
      backgroundColor: const Color(0xffece6df),
      body: const SingleChatBody()
    );
  }
}
