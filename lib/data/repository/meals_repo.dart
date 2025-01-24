import 'package:http_api_app/data/models/remote/meals_repo.dart';

abstract class MealsRepo {
  Future<List<MealsResponse>> getMeals();
}
