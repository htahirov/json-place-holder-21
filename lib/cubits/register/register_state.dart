part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterError extends RegisterState {
  RegisterError({this.message = 'Error Occured'});

  final String message;
}

class RegisterNetworkError extends RegisterState {
  RegisterNetworkError({this.message = 'Network Error Occured'});

  final String message;
}
