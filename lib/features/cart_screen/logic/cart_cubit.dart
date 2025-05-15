import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_e_commerce_app/features/cart_screen/data/models/get_user_cart_model.dart';
import 'package:new_e_commerce_app/features/cart_screen/data/repo/cart_repo.dart';

import '../../home_screen/data/models/products_model.dart';
import '../data/models/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;
  GetUserCartModel? _currentCart;

  CartCubit(this.cartRepo) : super(CartInitial());

  Future<void> getUserCart() async {
    emit(CartsLoading());
    final response = await cartRepo.getUserCart();
    response.fold(
          (error) => emit(ErrorGettingCarts(error: error)),
          (data) {
        _currentCart = data;
        emit(SuccessGettingCarts(cartModel: data));
      },
    );
  }

  Future<void> addToCart({required ProductDatum product, required productId}) async {
    emit(AddingToCart());
    final DateTime date = DateTime.now();
    final Either<String, CartModel> response = await cartRepo.addToCart(
        date: date.toString(), product: product, productId: productId);
    response.fold(
          (error) => emit(ErrorAddingToCarts(error: error)),
          (data) => emit(SuccessAddingToCarts(cartModel: data)),
    );
  }

  Future<void> removeSpecificItemFromCart({required productId}) async {
    GetUserCartModel? previousCart;
    if (state is SuccessGettingCarts) {
      previousCart = (state as SuccessGettingCarts).cartModel;
    } else if (_currentCart != null) {
      previousCart = _currentCart;
    }

    emit(RemovingFromCartLoading());
    try {
      final Either<String, GetUserCartModel> response = await cartRepo.removeSpecificItemFromCart(
        productId: productId,
      );

      response.fold(
            (error) {
          emit(RemovingFromCartFailure(error: error));
          // Restore previous state on error
          if (previousCart != null) {
            emit(SuccessGettingCarts(cartModel: previousCart));
          }
        },
            (data) {
          _currentCart = data;
          emit(RemovingFromCartSuccess(cartModel: data));
          emit(SuccessGettingCarts(cartModel: data));
        },
      );
    } catch(e) {
      log("Error in removing specific item from cart: $e");
      emit(RemovingFromCartFailure(error: e.toString()));
      // Restore previous state on exception
      if (previousCart != null) {
        emit(SuccessGettingCarts(cartModel: previousCart));
      }
    }
  }

  Future<void> clearCart() async {
    emit(RemovingFromCartLoading());
    try {
      final String response = await cartRepo.clearCart();
      emit(ClearAllInCart(message: response));
      emit(SuccessGettingCarts(cartModel: GetUserCartModel()));
    }catch(e) {
      log("Error in clearing cart: $e");
      emit(RemovingFromCartFailure(error: e.toString()));
    }
  }
}