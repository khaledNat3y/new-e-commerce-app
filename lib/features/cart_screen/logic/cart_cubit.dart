import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_e_commerce_app/features/cart_screen/data/repo/cart_repo.dart';

import '../../home_screen/data/models/products_model.dart';
import '../data/models/cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepo cartRepo;

  CartCubit(this.cartRepo) : super(CartInitial());

  Future<void> getUserCart() async {
    emit(CartsLoading());
    final response = await cartRepo.getUserCart();
    response.fold(
          (error) => emit(ErrorGettingCarts(error: error)),
          (data) => emit(SuccessGettingCarts(cartModel: data)),
    );
  }

  Future<void> addToCart(
      {required ProductsModel product, required int quantity}) async {
    emit(AddingToCart());
    final DateTime date = DateTime.now();
    final Either<String, CartModel> response = await cartRepo.addToCart(
        date: date.toString(), product: product, quantity: quantity);
    response.fold(
          (error) => emit(ErrorAddingToCarts(error: error)),
          (data) => emit(SuccessAddingToCarts(cartModel: data)),
    );

  }
}
