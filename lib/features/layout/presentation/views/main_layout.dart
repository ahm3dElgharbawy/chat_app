import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:chat_app/features/chats/presentation/view_models/chats_cubit/chats_cubit.dart';
import 'package:chat_app/features/layout/presentation/views/widgets/main_appbar.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:chat_app/features/layout/presentation/view_models/layout_cubit/layout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  }
  @override
  Widget build(BuildContext context) {
    final cubit = LayoutCubit.get(context);
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        return Scaffold(
          appBar: const MainAppBar(),
          floatingActionButton: cubit.currentIndex == 0
              ? SizedBox(
                  height: 56.r,
                  width: 56.r,
                  child: FloatingActionButton(
                    onPressed: () {},
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Icon(Icons.chat, size: 24.r),
                  ),
                )
              : null,
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
