import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/layout/presentation/view_models/layout_cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  Widget build(BuildContext context) {
    final cubit = LayoutCubit.get(context);
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Scaffold(
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
              selectedLabelStyle: TextStyles.regular28,
              unselectedLabelStyle: TextStyles.regular26,
              onTap: (index) {
                cubit.changeBottomNavBar(index);
              },
              items: cubit.navigationItems
                  .map(
                    (item) => BottomNavigationBarItem(
                      icon: Icon(item['icon']),
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
