import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/auth/auth_cubit.dart';
import '../utils/di/locator.dart';
import 'widgets/auth_check.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Add debug print
    print('Attempting to get AuthCubit from locator');
    
    try {
      final authCubit = locator<AuthCubit>();
      print('AuthCubit successfully retrieved');
      
      return BlocProvider.value(
        value: authCubit,
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const AuthCheck(),
        ),
      );
    } catch (e) {
      print('Error getting AuthCubit: $e');
      // Return a fallback UI showing the error
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('Initialization Error: $e'),
          ),
        ),
      );
    }
  }
}