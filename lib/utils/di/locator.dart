import 'package:get_it/get_it.dart';
import '../../cubits/auth/auth_cubit.dart';
import '../../cubits/login/login_cubit.dart';
import '../../cubits/otp/otp_cubit.dart';
import '../../cubits/products/products_cubit.dart';
import '../../cubits/register/register_cubit.dart';
import '../../data/impl_repository/i_auth_repo.dart';
import '../../data/impl_repository/i_post_repository.dart';
import '../../data/impl_repository/i_products_repo.dart';
import '../../data/repository/auth_repo.dart';
import '../../data/repository/post_repository.dart';
import '../../data/repository/products_repo.dart';
import '../../data/services/remote/login_service.dart';
import '../../data/services/remote/post_service.dart';
import '../../data/services/remote/products_service.dart';
import '../../data/services/remote/register_service.dart';
import '../../data/services/remote/verify_email_service.dart';
import '../../providers/post_provider.dart';
import '../../data/services/local/auth_local_storage.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Local storage
  locator.registerLazySingleton(() => AuthLocalStorage());

  // Services
  locator.registerLazySingleton(() => LoginService());
  locator.registerLazySingleton(() => PostService());
  locator.registerLazySingleton(() => ProductsService());
  locator.registerLazySingleton(() => RegisterService());
  locator.registerLazySingleton(() => VerifyEmailService());

  // Repositories
  locator.registerLazySingleton<AuthRepo>(
    () => IAuthRepo(
      locator<RegisterService>(),
      locator<VerifyEmailService>(),
      locator<LoginService>(),
    ),
  );

  locator.registerLazySingleton<PostRepository>(
    () => IPostRepository(locator()),
  );

  locator.registerLazySingleton<ProductsRepo>(
    () => IProductsRepo(locator()),
  );

  // Providers and Cubits
  locator.registerLazySingleton(() => PostProvider(locator()));
  locator.registerFactory(() => ProductsCubit(locator()));
  locator.registerFactory(() => RegisterCubit(locator()));
  locator.registerFactory(() => OtpCubit(locator()));
  locator.registerFactory(() => AuthCubit(locator<AuthLocalStorage>()));
   locator.registerFactory(() => LoginCubit(locator<AuthRepo>(), locator<AuthLocalStorage>()));
}