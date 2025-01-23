import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_api_app/cubits/meals/meals_cubit.dart';
import 'package:http_api_app/ui/pages/meals/meals_page.dart';
import 'package:provider/provider.dart';

import '../cubits/otp/otp_cubit.dart';
import '../cubits/products/products_cubit.dart';
import '../cubits/register/register_cubit.dart';
import '../providers/post_provider.dart';
import '../ui/pages/otp/otp_page.dart';
import '../ui/pages/posts/posts_page.dart';
import '../ui/pages/products/products_page.dart';
import '../ui/pages/register/register_page.dart';
import 'di/locator.dart';

class Pager {
  Pager._();

  static Widget get register => BlocProvider<RegisterCubit>(
        create: (_) => locator(),
        child: const RegisterPage(),
      );

  static Widget get posts => ChangeNotifierProvider<PostProvider>(
        create: (_) => locator()..getPosts(),
        child: const PostsPage(),
      );

  static Widget otp(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider.value(value: context.read<RegisterCubit>()),
          BlocProvider<OtpCubit>(create: (_) => locator()),
        ],
        child: const OtpPage(),
      );

  static Widget get products => BlocProvider<ProductsCubit>(
        create: (_) => locator()..getProducts(),
        child: const ProductsPage(),
      );
   static Widget get meals => BlocProvider<MealsCubit>(
        create: (_) => locator()..getMeals(),
        child: const MealsPage(),
      );    

}
