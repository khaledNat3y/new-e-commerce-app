
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:new_e_commerce_app/core/di/dependency_injection.dart';
import 'package:new_e_commerce_app/core/helpers/storage_helper.dart';
import 'package:new_e_commerce_app/core/networking/api_endpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  Dio? dio;
  DioHelper() {
    initDio();
  }

  void initDio() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.apiBaseUrl,
        receiveDataWhenStatusError: true,
      ),
    );
    dio!.interceptors.add(PrettyDioLogger());

    // Add an interceptor to automatically add the token to requests
    dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await getIt<StorageHelper>().getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['token'] = token;
          }
          return handler.next(options);
        },
      ),
    );
  }

  Future<Response> getRequest({
    required String endPoint,
    Map<String, dynamic>? query,
  }) async {
    try {
      return await dio!.get(endPoint, queryParameters: query);
    } catch (e) {
      log("Error in GET: $e");
      rethrow;
    }
  }

  Future<Response> postRequest({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    try {
      return await dio!.post(endPoint, data: data);
    } catch (e) {
      log("Error in POST: $e");
      rethrow;
    }
  }

  Future<Response> putRequest({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    try {
      final Response response = await dio!.put(endPoint, data: data);
      return response;
    } catch (e) {
      log("Error in put request: ${e.toString()}");
      rethrow;
    }
  }

  Future<Response> deleteRequest({
    required String endPoint,
    Map<String, dynamic>? data,
  }) async {
    try {
      final Response response = await dio!.delete(endPoint, data: data);
      return response;
    } catch (e) {
      log("Error in delete request: ${e.toString()}");
      rethrow;
    }
  }
}