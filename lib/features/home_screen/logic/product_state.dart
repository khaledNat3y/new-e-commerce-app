part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}


final class ProductSuccess extends ProductState {
  final ProductsModel products;
  ProductSuccess(this.products);
}

final class GetCategoriesSuccess extends ProductState {
  final CategoriesModel products;
  GetCategoriesSuccess(this.products);
}


final class ProductError extends ProductState {
  final String error;
  ProductError(this.error);
}
