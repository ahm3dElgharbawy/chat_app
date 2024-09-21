import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentScreen = 0;
  final List<Map> navigationItems = [
    {'icon': Icons.home_rounded, 'label': "home"},
    {'icon': Icons.calendar_today, 'label': "stories"},
  ];
  final List<Widget> screens = [];
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (newIndex) {
          setState(() {
            currentScreen = newIndex;
          });
        },
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentScreen,
        onTap: (itemIndex) {
          setState(() {
            currentScreen = itemIndex;
            pageController.animateToPage(
              currentScreen,
              duration: const Duration(milliseconds: 100),
              curve: Curves.linear,
            );
          });
        },
        items: navigationItems
            .map(
              (item) => BottomNavigationBarItem(
                icon: Icon(item['icon']),
                label: item['label'],
              ),
            )
            .toList(),
      ),
    );
  }
}
