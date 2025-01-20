import 'package:get_it/get_it.dart';
import 'package:http_api_app/cubits/otp/otp_cubit.dart';

import '../../cubits/products/products_cubit.dart';
import '../../cubits/register/register_cubit.dart';
import '../../data/impl_repository/i_auth_repo.dart';
import '../../data/impl_repository/i_post_repository.dart';
import '../../data/impl_repository/i_products_repo.dart';
import '../../data/repository/auth_repo.dart';
import '../../data/repository/post_repository.dart';
import '../../data/repository/products_repo.dart';
import '../../data/services/post_service.dart';
import '../../data/services/products_service.dart';
import '../../data/services/register_service.dart';
import '../../data/services/verify_email_service.dart';
import '../../providers/post_provider.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Services
  locator.registerLazySingleton(() => PostService());
  locator
      .registerLazySingleton<PostRepository>(() => IPostRepository(locator()));

  locator.registerLazySingleton(() => ProductsService());
  locator.registerLazySingleton<ProductsRepo>(() => IProductsRepo(locator()));

  locator.registerLazySingleton(() => RegisterService());
  locator.registerLazySingleton(() => VerifyEmailService());
  locator
      .registerLazySingleton<AuthRepo>(() => IAuthRepo(locator(), locator()));

  // Providers and Cubits
  locator.registerFactory(() => PostProvider(locator()));
  locator.registerFactory(() => ProductsCubit(locator()));
  locator.registerFactory(() => RegisterCubit(locator()));
  locator.registerFactory(() => OtpCubit(locator()));
}
