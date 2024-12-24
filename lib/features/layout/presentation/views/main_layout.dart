import 'package:chat_app/core/common_widgets/contact_card.dart';
import 'package:chat_app/core/enums/media_type.dart';
import 'package:chat_app/core/enums/seen_status.dart';
import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/core/helpers/helper_functions.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:chat_app/features/chats/data/models/chat.dart';
import 'package:chat_app/features/chats/presentation/view_models/chats_cubit/chats_cubit.dart';
import 'package:chat_app/features/chats/presentation/views/single_chat_screen.dart';
import 'package:chat_app/features/layout/presentation/views/custom_search_delegate.dart';
import 'package:chat_app/features/layout/presentation/views/widgets/contacts_button.dart';
import 'package:chat_app/features/layout/presentation/views/widgets/main_appbar.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/layout/presentation/view_models/layout_cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});
  static const routeName = "/mainLayout";
  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  void initState() {
    super.initState();
    context.read<ChatsCubit>().fetchChats();
    context.read<ChatsCubit>().fetchGroupChats();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = LayoutCubit.get(context);
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Scaffold(
          appBar: MainAppBar(
            onTapSearch: () async {
              await showSearch(
                context: context,
                delegate: CustomSearchDelegate<ChatModel>(
                  itemToString: (chat) => chat.chatHeader.name,
                  buildListItem: (chat) => CustomContactCard(
                    image: chat.chatHeader.avatar,
                    lastMessageType: chat.lastMessage != null &&
                            chat.lastMessage!.file != null
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
                      context.pushNamed(
                          SingleChatScreen.routeName, chat.chatHeader);
                    },
                  ),
                  searchList: [
                    ...context.read<ChatsCubit>().chats,
                    ...context.read<ChatsCubit>().groupChats
                  ],
                ),
              );
            },
          ),
          floatingActionButton:
              cubit.currentIndex == 0 ? const ShowContactsButtons() : null,
          body: PageView(
            controller: cubit.pageController,
            physics: const NeverScrollableScrollPhysics(),
            // onPageChanged: (newIndex) {
            // cubit.changeBottomNavBar(newIndex);
            // },
            children: cubit.screens,
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              splashColor: Colors.transparent,
            ), // removing splash effect from navbar
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              currentIndex: cubit.currentIndex,
              selectedLabelStyle: TextStyles.regular14,
              unselectedLabelStyle: TextStyles.regular12,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.navigationItems
                  .map(
                    (item) => BottomNavigationBarItem(
                      icon: Icon(item['icon'], size: 24.r),
                      label: item['label'],
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
