import 'package:chat_app/core/constants/routes.dart';
import 'package:chat_app/core/services/custom_bloc_observer.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/features/auth/presentation/views/login_screen.dart';
import 'package:chat_app/features/auth/presentation/views/register_screen.dart';
import 'package:chat_app/features/home/presentation/views/home_screen.dart';
import 'package:chat_app/features/splash/presentation/views/splash_screen.dart';
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
    return MaterialApp(
      title: 'Whats App lite',
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Inter",
        useMaterial3: false,
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
        AppRoutes.home: (context) => const HomeScreen(),
      },
    );
  }
}
