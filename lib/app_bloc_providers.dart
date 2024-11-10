import 'package:chat_app/core/services/firebase_auth_service.dart';
import 'package:chat_app/core/services/firestore_service.dart';
import 'package:chat_app/features/auth/data/repos/auth_repo.dart';
import 'package:chat_app/features/auth/presentation/view_models/auth_cubit/auth_cubit.dart';
import 'package:chat_app/features/layout/presentation/view_models/layout_cubit/layout_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  AppBlocProviders._internal();
  static get() => [
        BlocProvider(create: (context) => LayoutCubit()),
        BlocProvider(
          create: (context) => AuthCubit(
            AuthRepoImpl(
              databaseService: FireStoreService(),
              firebaseAuthService: FirebaseAuthService(),
            ),
          ),
        ),
      ];
}
