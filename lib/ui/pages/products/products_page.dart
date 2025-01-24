import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/products/products_cubit.dart';
import '../../widgets/global_loading.dart';
import 'widgets/product_grid_view.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {
          if (state is ProductsSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('All Products fetched successfully.'),
              ),
            );
          } else if (state is ProductsNetworkError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Network Error occurred.'),
              ),
            );
          }
        },
        builder: (_, state) {
          log(state.runtimeType.toString());
          if (state is ProductsLoading || state is ProductsInitial) {
            return const GlobalLoading();
          } else if (state is ProductsSuccess) {
            return ProductGridView(products: state.products);
          } else if (state is ProductsNetworkError) {
            return Text(state.message);
          } else if (state is ProductsError) {
            return Text(state.message);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
