import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../data/models/remote/product_response.dart';

class ProductGridTile extends StatelessWidget {
  const ProductGridTile({
    super.key,
    required this.productResponse,
  });

  final ProductResponse productResponse;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      header: Image.network(
        productResponse.image!,
        height: 120,
      ),
      footer: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              productResponse.title ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              productResponse.description ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            if (productResponse.rating?.rate == 0)
              RatingBar.builder(
                initialRating: productResponse.rating!.rate!,
                minRating: 1,
                itemSize: 24,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
            Text('Price: ${productResponse.price}'),
            Text(productResponse.category),
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
