import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/remote/product_response.dart';
import '../../data/repository/products_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._productsRepo) : super(ProductsInitial());

  final ProductsRepo _productsRepo;

  void getProducts() async {
    try {
      emit(ProductsLoading());
      final products = await _productsRepo.getProducts();
      emit(ProductsSuccess(products));
    } on SocketException {
      emit(ProductsNetworkError());
    } catch (e) {
      emit(ProductsError(message: '$e'));
    }
  }
}
