import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_e_commerce_app/features/home_screen/data/repo/home_repo.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final HomeRepo homeRepo;

  CategoriesCubit(this.homeRepo) : super(CategoriesInitial());

  Future<void> getCategories() async {
    emit(CategoriesLoading());
    final Either<String, List<String>> result = await homeRepo.getCategories();
    result.fold(
      (failure) {
        emit(CategoriesError(failure));
      },
      (categories) {
        emit(CategoriesSuccess(categories));
      },
    );
  }
}
