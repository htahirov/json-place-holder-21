import 'package:http_api_app/data/models/remote/meals_repo.dart';
import 'package:http_api_app/data/repository/meals_repo.dart';

import '../services/meals_service.dart';

class IMealsRepo implements MealsRepo {
  IMealsRepo(this._mealsService);
  final MealsService _mealsService;
  //salam
  @override
  Future<List<MealsResponse>> getMeals() => _mealsService.getMeals();
}
