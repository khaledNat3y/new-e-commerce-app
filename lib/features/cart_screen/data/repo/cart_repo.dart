import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:new_e_commerce_app/core/networking/dio_helper.dart';
import 'package:new_e_commerce_app/features/cart_screen/data/models/cart_model.dart';
import 'package:new_e_commerce_app/features/cart_screen/data/models/get_user_cart_model.dart';
import 'package:new_e_commerce_app/features/home_screen/data/models/products_model.dart';

import '../../../../core/networking/api_endpoints.dart';

class CartRepo {
  final DioHelper dioHelper;

  CartRepo(this.dioHelper);
  /// Get User Cart
  Future<Either<String, GetUserCartModel>> getUserCart() async {
    try {
      final Response response = await dioHelper.getRequest(
        endPoint: ApiEndpoints.getLoggedInUserCartRouteEndPoint,
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final GetUserCartModel cartModelResponse = GetUserCartModel.fromMap(response.data);
        return Right(cartModelResponse);
      } else {
        return Left(response.toString());
      }
    } catch (e) {
      log("Unexpected error: $e");
      return const Left("Unexpected error occurred");
    }
  }
  /// Post Request
  Future<Either<String, CartModel>> addToCart({required String date, required ProductDatum product, required String productId}) async {
    try {
      final Response response = await dioHelper.postRequest(
        endPoint: ApiEndpoints.addToCartEndPoint,
        data: {
          "productId": productId,
        }
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final CartModel cartModelResponse = CartModel.fromMap(response.data);
        return Right(cartModelResponse);
      } else {
        return Left(response.toString());
      }
    } catch (e) {
      log("Unexpected error: $e");
      return const Left("Unexpected error occurred");
    }
  }
  /// Delete Request
  Future<Either<String, GetUserCartModel>> removeSpecificItemFromCart({required String productId}) async {
    try {
      final Response response = await dioHelper.deleteRequest(
        endPoint: "${ApiEndpoints.addToCartEndPoint}/$productId",
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final GetUserCartModel cartModelResponse = GetUserCartModel.fromMap(response.data);
        return Right(cartModelResponse);
      } else {
        return Left(response.toString());
      }
    } catch (e) {
      log("Unexpected error: $e");
      return const Left("Unexpected error occurred");
    }
  }
  Future<String> clearCart() async {
    try {
      final Response response = await dioHelper.deleteRequest(
        endPoint: ApiEndpoints.deleteAllInCartRouteEndPoint,
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return "Cart cleared successfully";
      } else {
        return response.toString();
      }
    } catch (e) {
      log("Unexpected error: $e");
      return "Unexpected error occurred";
    }
  }
}
