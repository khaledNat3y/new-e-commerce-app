part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}


final class AuthLoginSuccess extends AuthState {
  final LoginResponseModel loginResponseModel;
  AuthLoginSuccess(this.loginResponseModel);
}

final class AuthRegisterSuccess extends AuthState {
  final RegisterResponseModel registerResponseModel;
  AuthRegisterSuccess(this.registerResponseModel);
}

final class AuthError extends AuthState {
  final String? errorMessage;
  AuthError(this.errorMessage);
}


