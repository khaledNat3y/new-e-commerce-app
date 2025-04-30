import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_e_commerce_app/features/home_screen/data/repo/home_repo.dart';

import '../data/models/products_model.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final HomeRepo homeRepo;

  ProductCubit(this.homeRepo) : super(ProductInitial());

  Future<void> getProducts() async {
    emit(ProductLoading());
    final Either<String, List<ProductsModel>> result = await homeRepo.getProducts();
    result.fold(
      (failure) => emit(ProductError(failure)),
      (success) => emit(ProductSuccess(success)),
    );
  }

  Future<void> getProductsCategory(String category,) async {
    emit(ProductLoading());
    final Either<String, List<ProductsModel>> result = await homeRepo.getProductsCategory(category);
    result.fold(
      (failure) => emit(ProductError(failure)),
      (success) => emit(ProductSuccess(success)),
    );
  }
}
