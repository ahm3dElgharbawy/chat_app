import 'package:chat_app/features/auth/data/models/app_user.dart';
import 'package:chat_app/features/auth/data/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;
  void login({required String email, required String password}) async {
    emit(LoginLoading());
    final result = await authRepo.loginUser(email, password);
    result.fold(
      (failure) => emit(LoginFailure(errMessage: failure.message)),
      (user) => emit(
        LoginSuccess(user: user),
      ),
    );
  }

  void register(AppUser userData) async {
    emit(RegisterLoading());
    final result = await authRepo.registerUser(userData);
    result.fold(
      (failure) => emit(RegisterFailure(errMessage: failure.message)),
      (user) => emit(
        RegisterSuccess(user: user),
      ),
    );
  }
}
