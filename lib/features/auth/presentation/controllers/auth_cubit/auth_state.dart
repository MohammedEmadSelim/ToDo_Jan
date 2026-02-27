part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthRegisterLoading extends AuthState {}
final class AuthRegisterFailure extends AuthState {
  final String message;

  AuthRegisterFailure(this.message);
}
final class AuthRegisterSuccess extends AuthState {
  final String res;

  AuthRegisterSuccess(this.res);
}
//======================================================
final class AuthLoginLoading extends AuthState {}
final class AuthLoginFailure extends AuthState {
  final String message;

  AuthLoginFailure(this.message);
}
final class AuthLoginSuccess extends AuthState {
  final User? res;

  AuthLoginSuccess(this.res);
}

