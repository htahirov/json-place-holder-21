

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_api_app/data/models/remote/meals_repo.dart';
import 'package:http_api_app/data/repository/meals_repo.dart';

part 'meals_state.dart';

class MealsCubit extends Cubit<MealsState> {
  MealsCubit(this.mealsRepo) : super(MealsInitial());
  final MealsRepo mealsRepo;
  void getMeals() async {
    try {
      emit(MealsLoading());
      final meals = await mealsRepo.getMeals();
      emit(MealsSuccess(meals));
    } on SocketException {
      emit(MealsNetworkError());
    } catch (e) {
      emit(MealsError());
    }
  }
}
