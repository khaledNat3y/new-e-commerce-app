part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartsLoading extends CartState {}

final class SuccessGettingCarts extends CartState {
  final GetUserCartModel cartModel;
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

final class RemovingFromCartLoading extends CartState {}

final class ClearAllInCart extends CartState {
  final String message;
  ClearAllInCart({required this.message});
}

final class RemovingFromCartSuccess extends CartState {
  final GetUserCartModel cartModel;
  RemovingFromCartSuccess({required this.cartModel});
}


final class RemovingFromCartFailure extends CartState {
  final String error;
  RemovingFromCartFailure({required this.error});
}
