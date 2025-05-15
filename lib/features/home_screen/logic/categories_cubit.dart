import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_e_commerce_app/features/home_screen/data/models/categories_model.dart';
import 'package:new_e_commerce_app/features/home_screen/data/repo/home_repo.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final HomeRepo homeRepo;

  CategoriesCubit(this.homeRepo) : super(CategoriesInitial());

  Future<void> getCategories() async {
    emit(CategoriesLoading());
    try {
      final Either<String, CategoriesModel> result = await homeRepo.getCategories();
      result.fold(
            (failure) {
          emit(CategoriesError(failure));
        },
            (categories) {
          emit(CategoriesSuccess(categories));
        },
      );
    }catch(e) {
      emit(CategoriesError(e.toString()));
    }
  }
}