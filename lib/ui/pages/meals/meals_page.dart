import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_api_app/cubits/meals/meals_cubit.dart';
import 'package:http_api_app/ui/pages/meals/widgets/meals_grid_view.dart';
import '../../widgets/global_loading.dart';

class MealsPage extends StatelessWidget {
  const MealsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: BlocConsumer<MealsCubit, MealsState>(
        listener: (context, state) {
          if (state is MealsSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('All Products fetched successfully.'),
              ),
            );
          } else if (state is MealsNetworkError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Network Error occurred.'),
              ),
            );
          }
        },
        builder: (_, state) {
          if (state is MealsLoading || state is MealsInitial) {
            return const GlobalLoading();
          } else if (state is MealsSuccess) {
            return MealsGridView(meal: state.meals);
          } else if (state is MealsNetworkError) {
            return const Text("");
          } else if (state is MealsError) {
            return const Text("");
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
