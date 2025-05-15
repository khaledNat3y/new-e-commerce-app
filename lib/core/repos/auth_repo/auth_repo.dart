import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
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
  final InternetConnectionChecker connectionChecker;

  AuthRepo(this.dioHelper, this.connectionChecker);

  Future<Either<String, LoginResponseModel>> login(String userName,
      String password,) async {
    try {
      final Response response = await dioHelper.postRequest(
        endPoint: ApiEndpoints.loginRouteEndPoint,
        data: {"email": userName, "password": password},
      );
      if (await connectionChecker.hasConnection &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        final LoginResponseModel loginResponseModel =
        LoginResponseModel.fromMap(response.data);
        if (loginResponseModel.token != null) {
          await getIt<StorageHelper>().saveToken(loginResponseModel.token!);
          return Right(loginResponseModel);
        } else {
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

  Future<Either<RegisterResponseModelError, RegisterResponseModel>> register(
      String userName,
      String email,
      String password,
      String rePassword,
      String phone) async {
    try {
      final Response response = await dioHelper.postRequest(
        endPoint: ApiEndpoints.registerRouteEndPoint,
        data: {
          "name": userName,
          "email": email,
          "password": password,
          "rePassword": rePassword,
          "phone": phone
        },
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final RegisterResponseModel registerResponseModel =
        RegisterResponseModel.fromMap(response.data);
        if (registerResponseModel.token != null) {
          await getIt<StorageHelper>().saveToken(registerResponseModel.token!);
          return Right(registerResponseModel);
        } else {
          return Left(
            RegisterResponseModelError(
              statusMsg: "fail",
              message: "Token is null",
            ),
          );
        }
      } else {
        return Left(response.data);
      }
    } catch (e) {
      log("Unexpected error: $e");
      return Left(
        RegisterResponseModelError(statusMsg: "fail", message: e.toString()),
      );
    }
  }
}
