part of 'reset_password_cubit.dart';

@immutable
sealed class ResetPasswordState {}

final class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordSuccess extends ResetPasswordState {}

class ResetPasswordError extends ResetPasswordState {
  ResetPasswordError({this.message = 'Error Occured'});

  final String message;
}

class ResetPasswordNetworkError extends ResetPasswordState {
  ResetPasswordNetworkError({this.message = 'Network Error Occured'});

  final String message;
}
