part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartsLoading extends CartState {}

final class SuccessGettingCarts extends CartState {
  final CartModel cartModel;
  SuccessGettingCarts({required this.cartModel});
}

final class ErrorGettingCarts extends CartState {
  final String error;
  ErrorGettingCarts({required this.error});
}

final class AddingToCart extends CartState {}

final class SuccessAddingToCarts extends CartState {
  final CartModel cartModel;
  SuccessAddingToCarts({required this.cartModel});
}

final class ErrorAddingToCarts extends CartState {
  final String error;
  ErrorAddingToCarts({required this.error});
}


