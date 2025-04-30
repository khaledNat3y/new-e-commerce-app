import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:new_e_commerce_app/core/di/dependency_injection.dart';
import 'package:new_e_commerce_app/core/helpers/constants.dart';
import 'package:new_e_commerce_app/core/helpers/shared_pref_helper.dart';
import 'package:new_e_commerce_app/core/helpers/storage_helper.dart';
import 'package:new_e_commerce_app/core/models/auth_models/login_response_model.dart';
import 'package:new_e_commerce_app/core/models/auth_models/register_response_model.dart';
import 'package:new_e_commerce_app/core/networking/dio_helper.dart';

import '../../networking/api_endpoints.dart';

class AuthRepo {
  final DioHelper dioHelper;

  AuthRepo(this.dioHelper);

  Future<Either<String, LoginResponseModel>> login(
    String userName,
    String password,
  ) async {
    try {
      final Response response = await dioHelper.postRequest(
        endPoint: ApiEndpoints.authLoginEndPoint,
        data: {"username": userName, "password": password},
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(response.data);
        if(loginResponseModel.token != null) {
          await getIt<StorageHelper>().saveToken(loginResponseModel.token!);
          return Right(loginResponseModel);
        }else {
          return const Left("Token is null");
        }
      } else {
        return Left(response.toString());
      }
    } catch (e) {
      log("Unexpected error: $e");
      return const Left("Unexpected error occurred");
    }
  }

  Future<Either<String, RegisterResponseModel>> register(
    String userName,
    String email,
    String password,
  ) async {
    try {
      final Response response = await dioHelper.postRequest(
        endPoint: ApiEndpoints.registerEndPoint,
        data: {"username": userName, "email": email, "password": password},
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, response.data['token']);
        return Right(RegisterResponseModel.fromJson(response.data));
      } else {
        return Left(response.toString());
      }
    } catch (e) {
      log("Unexpected error: $e");
      return const Left("Unexpected error occurred");
    }
  }
}
