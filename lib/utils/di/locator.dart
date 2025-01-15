import 'package:get_it/get_it.dart';

import '../../data/impl_repository/i_post_repository.dart';
import '../../data/repository/post_repository.dart';
import '../../data/services/post_service.dart';
import '../../providers/post_provider.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Services
  locator.registerLazySingleton(() => PostService());
  locator
      .registerLazySingleton<PostRepository>(() => IPostRepository(locator()));

  // Providers
  locator.registerFactory(() => PostProvider(locator()));
}
