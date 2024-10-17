import 'package:chat_app/features/chats/presentation/views/chats_screen.dart';
import 'package:chat_app/features/status/presentation/views/statuses_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(BuildContext context) => BlocProvider.of(context);
  int currentIndex = 0;
  final pageController = PageController(initialPage: 0);

  final List<Widget> screens = [
    const ChatsScreen(),
    const StatusesScreen(),
    const Placeholder(color: Colors.grey),
  ];
  final List<Map> navigationItems = [
    {'icon': Icons.chat, 'label': "Chats"},
    {'icon': Icons.tips_and_updates, 'label': "Status"},
    {'icon': Icons.phone, 'label': "Calls"},
  ];

  void changeBottomNavBar(int newIndex) {
    currentIndex = newIndex;
    pageController.jumpToPage(
      newIndex,
    );
    emit(BottomNavigationBarChanged());
  }
}
