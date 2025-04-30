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

  Future<Either<String, List<ProductsModel>>> getProducts() async {
    try {
      final Response response = await dioHelper.getRequest(
        endPoint: ApiEndpoints.getAllProductsEndPoint,
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final List<ProductsModel> products = productsModelFromMap(response.data);
        return Right(products);
      } else {
        return Left(response.toString());
      }
    } catch (e) {
      log("Unexpected error: $e");
      return const Left("Unexpected error occurred");
    }
  }

  Future<Either<String, List<ProductsModel>>> getProductsCategory(String category,) async {
    try {
      final Response response = await dioHelper.getRequest(
        endPoint: "${ApiEndpoints.categoryProducts}/$category",
        query: {"category": category},
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final List<ProductsModel> products = productsModelFromMap(response.data);
        return Right(products);
      } else {
        return Left(response.toString());
      }
    } catch (e) {
      log("Unexpected error: $e");
      return const Left("Unexpected error occurred");
    }
  }


  Future<Either<String, List<String>>> getCategories() async {
    try {
      final Response response = await dioHelper.getRequest(
        endPoint: ApiEndpoints.getCategoriesEndPoint,);
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final List<String> categories = categoriesModelFromMap(response.data);
        categories.insert(0, ("All"));
        return Right(categories);
      } else {
        return Left(response.toString());
      }
    } catch (e) {
      log("Unexpected error: $e");
      return const Left("Unexpected error occurred");
    }
  }

}
