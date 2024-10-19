import 'package:chat_app/app_bloc_providers.dart';
import 'package:chat_app/core/constants/routes.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_provider.dart';
import 'package:chat_app/core/services/custom_bloc_observer.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/features/auth/presentation/views/login_screen.dart';
import 'package:chat_app/features/auth/presentation/views/register_screen.dart';
import 'package:chat_app/features/chats/presentation/views/chats_screen.dart';
import 'package:chat_app/features/chats/presentation/views/single_chat_screen.dart';
import 'package:chat_app/features/profile/presentation/views/profile_screen.dart';
import 'package:chat_app/features/splash/presentation/views/splash_screen.dart';
import 'package:chat_app/features/layout/presentation/views/main_layout.dart';
import 'package:chat_app/features/status/presentation/views/statuses_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return SizedProvider(
      designSize: const Size(720, 1600), // screen width and height taken from figma
      height: context.screenHeight,
      width: context.screenWidth,
      child: MultiBlocProvider(
        providers: AppBlocProviders.get(),
        child: MaterialApp(
          title: 'Whats App lite',
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "Inter",
            primaryColor: AppColors.primary,
            scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: AppColors.primary,
            ),
          ),
          initialRoute: AppRoutes.splash,
          routes: {
            // =============================================
            // to navigate to any screen by it's route name
            // =============================================
            AppRoutes.initial: (context) => const LoginScreen(),
            AppRoutes.splash: (context) => const SplashScreen(),
            AppRoutes.layout: (context) => const MainLayout(),
            AppRoutes.login: (context) => const LoginScreen(),
            AppRoutes.register: (context) => const RegisterScreen(),
            AppRoutes.chats: (context) => const ChatsScreen(),
            AppRoutes.singleChat: (context) => const SingleChatScreen(),
            AppRoutes.statuses: (context) => const StatusesScreen(),
            AppRoutes.profile: (context) => const ProfileScreen(),
          },
        ),
      ),
    );
  }
}
