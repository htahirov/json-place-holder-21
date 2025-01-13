import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/otp_provider.dart';
import '../providers/post_provider.dart';
import '../providers/register_provider.dart';
import '../ui/pages/otp/otp_page.dart';
import '../ui/pages/posts/posts_page.dart';
import '../ui/pages/register/register_page.dart';

class Pager {
  Pager._();

  static Widget get register => ChangeNotifierProvider(
        create: (_) => RegisterProvider(),
        child: const RegisterPage(),
      );

  static Widget get posts => ChangeNotifierProvider(
        create: (_) => PostProvider()..getPosts(),
        child: const PostsPage(),
      );

  static Widget otp(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: context.read<RegisterProvider>()),
          ChangeNotifierProvider(create: (_) => OtpProvider()),
        ],
        child: const OtpPage(),
      );
}
