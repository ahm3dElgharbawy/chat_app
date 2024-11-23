import 'dart:developer';

import 'package:chat_app/core/common_widgets/contact_card.dart';
import 'package:chat_app/core/common_widgets/loading_widget.dart';
import 'package:chat_app/core/constants/image_strings.dart';
import 'package:chat_app/core/constants/routes.dart';
import 'package:chat_app/core/constants/strings.dart';
import 'package:chat_app/core/enums/media_type.dart';
import 'package:chat_app/core/enums/seen_status.dart';
import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/core/extensions/toast.dart';
import 'package:chat_app/features/chats/presentation/view_models/chats_cubit/chats_cubit.dart';
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
        return ListView.builder(
          itemBuilder: (context, i) => CustomContactCard(
            image: ImageStrings.user,
            lastMessageType: MediaType.text,
            seenStatus: SeenStatus.read,
            unReadCount: 2,
            time: DateFormat('hh:mm a').format(cubit.chats[i].date),
            isLastMessageForMe: false,
            userName: "Rowan",
            text: cubit.chats[i].lastMessage, // required if last message is text
            onTap: () {
              context.pushNamed(AppRoutes.singleChat);
            },
          ),
          // separatorBuilder: (context, i) => AppSizes.h20,
          itemCount: cubit.chats.length,
        );
      },
    );
  }
}
