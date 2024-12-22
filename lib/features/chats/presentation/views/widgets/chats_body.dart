import 'dart:developer';
import 'dart:ffi';

import 'package:chat_app/core/common_widgets/contact_card.dart';
import 'package:chat_app/core/common_widgets/loading_widget.dart';
import 'package:chat_app/core/enums/media_type.dart';
import 'package:chat_app/core/enums/seen_status.dart';
import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/core/extensions/toast.dart';
import 'package:chat_app/core/helpers/helper_functions.dart';
import 'package:chat_app/features/chats/presentation/view_models/chats_cubit/chats_cubit.dart';
import 'package:chat_app/features/chats/presentation/views/single_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ChatsBody extends StatelessWidget {
  const ChatsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatsCubit>();
    log(cubit.chats.length.toString());
    return BlocConsumer<ChatsCubit, ChatsState>(
      listener: (context, state) {
        if (state is GetChatsFailure) {
          state.message.showAsToast(Colors.red);
        }
      },
      builder: (context, state) {
        if (state is GetChatsLoading) {
          return const CustomLoadingWidget();
        }
        final allChats = cubit.chats + cubit.groupChats;
        return ListView.builder(
          itemCount: allChats.length,
          itemBuilder: (context, i) {
            final chat = allChats[i];
            return CustomContactCard(
              image: chat.chatHeader.avatar,
              lastMessageType:
                  chat.lastMessage != null && chat.lastMessage!.file != null
                      ? getMediaType(url: chat.lastMessage!.file!)
                      : MediaType.text,
              seenStatus: SeenStatus.delivered,
              unReadCount: 0,
              time: DateFormat('hh:mm a').format(chat.date),
              isLastMessageForMe: chat.isLastMessageByMe,
              userName: chat.chatHeader.name,
              text: chat.lastMessage?.message ??
                  "", // required if last message is text
              onTap: () {
                context.pushNamed(SingleChatScreen.routeName, chat.chatHeader);
              },
            );
          },
        );
      },
    );
  }
}
