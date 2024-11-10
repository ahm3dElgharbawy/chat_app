part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

// login
final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {
  final AppUser user;
  LoginSuccess({required this.user});
}

final class LoginFailure extends AuthState {
  final String errMessage;
  LoginFailure({required this.errMessage});
}

// register
final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {
  final AppUser user;
  RegisterSuccess({required this.user});
}

final class RegisterFailure extends AuthState {
  final String errMessage;
  RegisterFailure({required this.errMessage});
}
