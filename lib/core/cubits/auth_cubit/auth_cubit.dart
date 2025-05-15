import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_e_commerce_app/core/models/auth_models/login_response_model.dart';
import 'package:new_e_commerce_app/core/models/auth_models/register_response_model.dart';

import '../../repos/auth_repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    final Either<String, LoginResponseModel> response = await authRepo.login(
      email,
      password,
    );
    response.fold(
      (error) {
        emit(AuthError(error));
      },
      (response) {
        emit(AuthLoginSuccess(response));
      },
    );
  }

  Future<void> register(
    String userName,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    emit(AuthLoading());
    final Either<RegisterResponseModelError, RegisterResponseModel> response =
        await authRepo.register(userName, email, password, rePassword, phone);
    response.fold(
      (error) {
        emit(AuthError(error.message));
      },
      (response) {
        emit(AuthRegisterSuccess(response));
      },
    );
  }
}
