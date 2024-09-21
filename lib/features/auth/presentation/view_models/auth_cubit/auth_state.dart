part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

// login
final class LoginLoading extends AuthState {}

final class LoginSuccess extends AuthState {}

final class LoginFailure extends AuthState {
  final String errMessage;
  LoginFailure(this.errMessage);
}

// register
final class RegisterLoading extends AuthState {}

final class RegisterSuccess extends AuthState {}

final class RegisterFailure extends AuthState {
  final String errMessage;
  RegisterFailure(this.errMessage);
}
