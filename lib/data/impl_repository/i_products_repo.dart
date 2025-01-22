import '../models/remote/product_response.dart';
import '../repository/products_repo.dart';
import '../services/remote/products_service.dart';

class IProductsRepo implements ProductsRepo {
  IProductsRepo(this._productsService);

  final ProductsService _productsService;

  @override
  Future<List<ProductResponse>> getProducts() => _productsService.getProducts();
}
