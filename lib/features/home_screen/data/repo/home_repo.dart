import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:new_e_commerce_app/core/networking/api_endpoints.dart';
import 'package:new_e_commerce_app/core/networking/dio_helper.dart';
import 'package:new_e_commerce_app/features/home_screen/data/models/products_model.dart';

import '../models/categories_model.dart';

class HomeRepo {
  final DioHelper dioHelper;

  HomeRepo(this.dioHelper);

  Future<Either<String, ProductsModel>> getProducts() async {
    try {
      final Response response = await dioHelper.getRequest(
        endPoint: ApiEndpoints.getAllProductsFromRouteApi,
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final ProductsModel products = ProductsModel.fromJson(response.data);
        return Right(products);
      } else {
        return Left(response.toString());
      }
    } catch (e) {
      log("Unexpected error: $e");
      return const Left("Unexpected error occurred");
    }
  }

  Future<Either<String, ProductsModel>> getProductsCategory(String categoryId,) async {
    try {
      final Response response = await dioHelper.getRequest(
        endPoint: ApiEndpoints.getAllProductsFromRouteApi,
        query: {"category[in]": categoryId},
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final products = ProductsModel.fromJson(response.data);
        return Right(products);
      } else {
        return Left(response.toString());
      }
    } catch (e) {
      log("Unexpected error: $e");
      return const Left("Unexpected error occurred");
    }
  }


  Future<Either<String, CategoriesModel>> getCategories() async {
    try {
      final Response response = await dioHelper.getRequest(
        endPoint: ApiEndpoints.getCategoriesRouteEndPoint,
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final CategoriesModel categoryModel = CategoriesModel.fromMap(response.data);
        categoryModel.data?.insert(0, Datum(name: "All"));
        return Right(categoryModel);
      } else {
        return Left(response.toString());
      }
    } catch (e) {
      log("Unexpected error: $e");
      return const Left("unexpected error occurred");
    }
  }

}
