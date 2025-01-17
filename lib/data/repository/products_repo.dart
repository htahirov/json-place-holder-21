import '../models/remote/product_response.dart';

abstract class ProductsRepo {
  Future<List<ProductResponse>> getProducts();
}
