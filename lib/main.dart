import 'package:chat_app/app_bloc_providers.dart';
import 'package:chat_app/core/constants/routes.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_provider.dart';
import 'package:chat_app/core/services/custom_bloc_observer.dart';
import 'package:chat_app/core/services/shared_prefs_singleton.dart';
import 'package:chat_app/core/themes/colors.dart';
import 'package:chat_app/features/splash/presentation/views/splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  Prefs.init(); // initializing shared preferences singleton
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Supabase.initialize(
    url: 'https://kghwlrstkekzfjuqiuke.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtnaHdscnN0a2VremZqdXFpdWtlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzMxNjMyMzAsImV4cCI6MjA0ODczOTIzMH0.MdQFNeEN2C6-gKda_FLenFYsHPomOM1t6Wtn2CcKVh4',
  );
  runApp(
    DevicePreview(
      enabled: kDebugMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return SizedProvider(
      designSize: const Size(360, 690),
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
          initialRoute: SplashScreen.routeName,
          routes: AppRoutes.get(),
        ),
      ),
    );
  }
}
