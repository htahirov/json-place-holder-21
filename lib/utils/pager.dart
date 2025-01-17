import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_api_app/ui/pages/products/products_page.dart';
import 'package:provider/provider.dart';

import '../cubits/products/products_cubit.dart';
import '../providers/otp_provider.dart';
import '../providers/post_provider.dart';
import '../providers/register_provider.dart';
import '../ui/pages/otp/otp_page.dart';
import '../ui/pages/posts/posts_page.dart';
import '../ui/pages/register/register_page.dart';
import 'di/locator.dart';

class Pager {
  Pager._();

  static Widget get register => ChangeNotifierProvider(
        create: (_) => RegisterProvider(),
        child: const RegisterPage(),
      );

  static Widget get posts => ChangeNotifierProvider<PostProvider>(
        create: (_) => locator()..getPosts(),
        child: const PostsPage(),
      );

  static Widget otp(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: context.read<RegisterProvider>()),
          ChangeNotifierProvider(create: (_) => OtpProvider()),
        ],
        child: const OtpPage(),
      );

  static Widget get products => BlocProvider<ProductsCubit>(
        create: (_) => locator()..getProducts(),
        child: const ProductsPage(),
      );
}
