import 'package:flutter/material.dart';
import 'package:http_api_app/data/models/remote/meals_repo.dart';
import 'package:http_api_app/ui/pages/meals/widgets/meals_grid_tile.dart';

class MealsGridView extends StatelessWidget {
  const MealsGridView({
    super.key,
    required this.meal,
  });

  final List<MealsResponse> meal;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: meal.length,
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        mainAxisExtent: 230,
      ),
      itemBuilder: (_, i) {
        final meals = meal[i];
        return MealsGridTile(mealsResponse: meals);
      },
    );
  }
}
