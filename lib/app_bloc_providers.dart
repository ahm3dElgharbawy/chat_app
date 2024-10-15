import 'package:chat_app/features/layout/presentation/view_models/layout_cubit/layout_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  AppBlocProviders._internal();
  static get() => [BlocProvider(create: (context) => LayoutCubit())];
}
