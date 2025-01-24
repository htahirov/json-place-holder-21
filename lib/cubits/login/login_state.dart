part of 'login_cubit.dart';
@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginError extends LoginState {
  LoginError({this.message = 'Login failed'});
  final String message;
}

class LoginNetworkError extends LoginState {
  LoginNetworkError({this.message = 'Network Error Occurred'});
  final String message;
}