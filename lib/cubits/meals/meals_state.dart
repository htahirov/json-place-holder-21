part of 'meals_cubit.dart';

@immutable
sealed class MealsState {}

final class MealsInitial extends MealsState {}
final class MealsSuccess extends MealsState {
  MealsSuccess(this.meals);
  final List<MealsResponse> meals;
}

final class MealsError extends MealsState {}
final class MealsLoading extends MealsState {}
final class MealsNetworkError extends MealsState {}


