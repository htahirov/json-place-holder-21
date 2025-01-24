import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http_api_app/data/models/remote/meals_repo.dart';

import '../../utils/extensions/int_extensions.dart';
import '../endpoints.dart';

class MealsService {
  Future<List<MealsResponse>> getMeals() async {
    final url = Uri.parse(Endpoints.meals);
    final response = await http.get(url);
    if (response.statusCode.isSuccess) {
      final List data = jsonDecode(response.body);
      return data.map((e) => MealsResponse.fromJson(e)).toList();
    }
    throw Exception('Failed to get products.');
  }
}
