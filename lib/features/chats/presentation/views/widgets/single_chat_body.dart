import 'package:chat_app/core/common_widgets/loading_widget.dart';
import 'package:chat_app/core/constants/sizes.dart';
import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:chat_app/features/chats/data/models/sender.dart';
import 'package:chat_app/features/chats/presentation/view_models/chats_cubit/chats_cubit.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/message_bubble.dart';
import 'package:chat_app/features/chats/presentation/views/widgets/write_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleChatBody extends StatelessWidget {
  const SingleChatBody({super.key});
  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    final ChatHeader chatHeader = context.args();
    return BlocConsumer<ChatsCubit, ChatsState>(
      listener: (context, state) {
        if (state is GetChatMessagesSuccess) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            scrollController.animateTo(
                scrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 200),
                curve: Curves.linear);
          });
        }
      },
      builder: (context, state) {
        if (state is GetChatMessagesLoading) {
          return const CustomLoadingWidget();
        }
        return Padding(
          padding: EdgeInsets.all(AppSizes.defaultSpace.r).copyWith(top: 0),
          child: Stack(
            fit: StackFit.expand,
            children: [
              // messages
              ListView(
                controller: scrollController,
                padding: EdgeInsets.only(
                  bottom: 100.h,
                  top: AppSizes.defaultSpace.r,
                ),
                children: [
                  ...context.read<ChatsCubit>().messages.map(
                        (message) => MessageBubble(message: message),
                      )
                ],
              ),
              // write and send message
              WriteMessageSection(
                isGroup: chatHeader.isGroup,
              )
            ],
          ),
        );
      },
    );
  }
}
