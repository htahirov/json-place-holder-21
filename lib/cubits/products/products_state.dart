part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsSuccess extends ProductsState {
  ProductsSuccess(this.products);

  final List<ProductResponse> products;
}

class ProductsError extends ProductsState {
  ProductsError({this.message = 'Error Occured'});

  final String message;
}

class ProductsNetworkError extends ProductsState {
  ProductsNetworkError({this.message = 'Network Error Occured'});

  final String message;
}
