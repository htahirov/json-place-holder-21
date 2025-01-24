import 'package:flutter/material.dart';
import 'package:http_api_app/data/models/remote/meals_repo.dart';

class MealsGridTile extends StatelessWidget {
  const MealsGridTile({super.key, required this.mealsResponse});

  final MealsResponse mealsResponse;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      header: Image.network(
        mealsResponse.image,
        height: 120,
      ),
      footer: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              mealsResponse.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text( 
              mealsResponse.category.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
      child: Card(
        color: Colors.white60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
