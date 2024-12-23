import 'package:chat_app/features/auth/presentation/views/login_screen.dart';
import 'package:chat_app/features/auth/presentation/views/register_screen.dart';
import 'package:chat_app/features/calls/presentation/views/calls_screen.dart';
import 'package:chat_app/features/chats/presentation/views/chats_screen.dart';
import 'package:chat_app/features/chats/presentation/views/contacts_screen.dart';
import 'package:chat_app/features/groups/presentation/views/add_members_screen.dart';
import 'package:chat_app/features/groups/presentation/views/group_details_screen.dart';
import 'package:chat_app/features/chats/presentation/views/single_chat_screen.dart';
import 'package:chat_app/features/groups/presentation/views/create_group_screen.dart';
import 'package:chat_app/features/layout/presentation/views/main_layout.dart';
import 'package:chat_app/features/profile/presentation/views/profile_screen.dart';
import 'package:chat_app/features/splash/presentation/views/splash_screen.dart';
import 'package:chat_app/features/status/presentation/views/statuses_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes._internal();
  static Map<String, Widget Function(BuildContext)> get() => {
        // =============================================
        // to navigate to any screen by it's route name
        // =============================================
        SplashScreen.routeName: (context) => const SplashScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        MainLayout.routeName: (context) => const MainLayout(),
        ChatsScreen.routeName: (context) => const ChatsScreen(),
        SingleChatScreen.routeName: (context) => const SingleChatScreen(),
        StatusesScreen.routeName: (context) => const StatusesScreen(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        CallsScreen.routeName: (context) => const CallsScreen(),
        ContactsScreen.routeName: (context) => const ContactsScreen(),
        CreateGroupScreen.routeName: (context) => const CreateGroupScreen(),
        GroupDetailsScreen.routeName: (context) => const GroupDetailsScreen(),
        AddMembersScreen.routeName: (context) => const AddMembersScreen(),
      };
}
