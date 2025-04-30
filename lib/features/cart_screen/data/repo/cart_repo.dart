import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:new_e_commerce_app/core/networking/dio_helper.dart';
import 'package:new_e_commerce_app/features/cart_screen/data/models/cart_model.dart';
import 'package:new_e_commerce_app/features/home_screen/data/models/products_model.dart';

import '../../../../core/networking/api_endpoints.dart';

class CartRepo {
  final DioHelper dioHelper;

  CartRepo(this.dioHelper);
  /// Get User Cart
  Future<Either<String, CartModel>> getUserCart() async {
    try {
      final Response response = await dioHelper.getRequest(
        endPoint: "${ApiEndpoints.getAllCartsEndPoint}/user/2",
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final CartModel cartModelResponse = CartModel.fromMap(response.data[0]);
        return Right(cartModelResponse);
      } else {
        return Left(response.toString());
      }
    } catch (e) {
      log("Unexpected error: $e");
      return const Left("Unexpected error occurred");
    }
  }
  /// Put Request
  Future<Either<String, CartModel>> addToCart(
      {required String date, required ProductsModel product, required int quantity}) async {
    try {
      final Response response = await dioHelper.putRequest(
        endPoint: "${ApiEndpoints.getAllCartsEndPoint}/3",
        data: {
          "userId" : 2,
          "date" : date,
          "products" : [{
            "productId" : product.id,
            "quantity" : quantity
          }],
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
}
