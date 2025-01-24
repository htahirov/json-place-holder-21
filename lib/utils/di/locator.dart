import 'package:get_it/get_it.dart';
import 'package:http_api_app/cubits/meals/meals_cubit.dart';
import 'package:http_api_app/data/impl_repository/i_meals_repo.dart';
import 'package:http_api_app/data/repository/meals_repo.dart';
import 'package:http_api_app/data/services/meals_service.dart';
import '../../cubits/auth/auth_cubit.dart';
import '../../cubits/login/login_cubit.dart';
import '../../cubits/otp/otp_cubit.dart';
import '../../cubits/products/products_cubit.dart';
import '../../cubits/register/register_cubit.dart';
import '../../cubits/resetPassword/reset_password_cubit.dart';
import '../../data/impl_repository/i_auth_repo.dart';
import '../../data/impl_repository/i_post_repository.dart';
import '../../data/impl_repository/i_products_repo.dart';
import '../../data/repository/auth_repo.dart';
import '../../data/repository/post_repository.dart';
import '../../data/repository/products_repo.dart';
import '../../data/services/local/auth_local_storage.dart';
import '../../data/services/remote/login_service.dart';
import '../../data/services/remote/post_service.dart';
import '../../data/services/remote/products_service.dart';
import '../../data/services/remote/register_service.dart';
import '../../data/services/remote/reset_password_service.dart';
import '../../data/services/remote/verify_email_service.dart';
import '../../providers/post_provider.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Local storage
  locator.registerLazySingleton(() => AuthLocalStorage());

  // Services
  locator.registerLazySingleton(() => LoginService());
  locator.registerLazySingleton(() => PostService());
  locator.registerLazySingleton(() => ProductsService());
  locator.registerLazySingleton<ProductsRepo>(() => IProductsRepo(locator()));

  locator.registerLazySingleton(() => MealsService());
  locator.registerLazySingleton<MealsRepo>(() => IMealsRepo(locator()));

  locator.registerLazySingleton(() => RegisterService());
  locator.registerLazySingleton(() => VerifyEmailService());
  locator.registerLazySingleton(() => ResetPasswordService());

  // Repositories
  locator.registerLazySingleton<AuthRepo>(
    () => IAuthRepo(
      locator<RegisterService>(),
      locator<VerifyEmailService>(),
      locator<LoginService>(),
      locator<ResetPasswordService>()
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
  locator.registerFactory(() => ResetPasswordCubit(locator()));
   locator.registerFactory(() => LoginCubit(locator<AuthRepo>(), locator<AuthLocalStorage>()));
}
  locator.registerFactory(() => MealsCubit(locator()));
}
