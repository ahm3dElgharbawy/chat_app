import 'package:chat_app/core/constants/routes.dart';
import 'package:chat_app/core/extensions/size_extensions.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_provider.dart';
import 'package:chat_app/core/services/custom_bloc_observer.dart';
import 'package:chat_app/core/themes/app_themes.dart';
import 'package:chat_app/features/auth/presentation/views/login_screen.dart';
import 'package:chat_app/features/auth/presentation/views/register_screen.dart';
import 'package:chat_app/features/home/presentation/views/home_screen.dart';
import 'package:chat_app/features/intro/presentation/views/onboarding_screen.dart';
import 'package:chat_app/features/intro/presentation/views/splash_screen.dart';
import 'package:chat_app/features/layout/presentation/views/main_layout.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SizedProvider(
      designSize: const Size(360, 690),
      height: context.screenHeight,
      width: context.screenWidth,
      child: MaterialApp(
        title: 'Chat APP',
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: AppThemes.light,
        routes: {
          AppRoutes.start: (context) => const LoginScreen(),
          AppRoutes.splash: (context) => const SplashScreen(),
          AppRoutes.layout: (context) => const MainLayout(),
          AppRoutes.onboarding: (context) => const OnboardingScreen(),
          AppRoutes.login: (context) => const LoginScreen(),
          AppRoutes.register: (context) => const RegisterScreen(),
          AppRoutes.home: (context) => const HomeScreen(),
        },
        // home: const SizedBox(),
      ),
    );
  }
}
