import 'package:get_it/get_it.dart';
import 'package:http_api_app/cubits/products/products_cubit.dart';

import '../../data/impl_repository/i_post_repository.dart';
import '../../data/impl_repository/i_products_repo.dart';
import '../../data/repository/post_repository.dart';
import '../../data/repository/products_repo.dart';
import '../../data/services/post_service.dart';
import '../../data/services/products_service.dart';
import '../../providers/post_provider.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Services
  locator.registerLazySingleton(() => PostService());
  locator
      .registerLazySingleton<PostRepository>(() => IPostRepository(locator()));

  locator.registerLazySingleton(() => ProductsService());
  locator
      .registerLazySingleton<ProductsRepo>(() => IProductsRepo(locator()));

  // Providers
  locator.registerFactory(() => PostProvider(locator()));
  locator.registerFactory(() => ProductsCubit(locator()));
}
