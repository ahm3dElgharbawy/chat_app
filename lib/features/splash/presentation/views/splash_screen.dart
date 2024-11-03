import 'package:chat_app/core/constants/image_strings.dart';
import 'package:chat_app/core/constants/routes.dart';
import 'package:chat_app/core/extensions/navigation.dart';
import 'package:chat_app/core/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:chat_app/core/themes/styles.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    waitAndGo();
  }

  // splash screen with duration 2 seconds
  void waitAndGo() {
    Future.delayed(const Duration(seconds: 3), () {
      context.pushReplacementAllNamed(AppRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeInImage(
                height: 200.h,
                placeholder: const AssetImage(
                  ImageStrings.empty,
                ),
                image: const AssetImage(
                  ImageStrings.logo,
                ),
              ),
              Text(
                "WhatsUp",
                style: TextStyles.bold24,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 100.h),
              child: Text(
                "The best chat app of this century",
                style: TextStyles.regular14,
              ),
            ),
          )
        ],
      ),
    );
  }
}
