import 'dart:developer';

import 'package:dio/dio.dart';
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
  }

   Future<Response> getRequest({required String endPoint, Map<String, dynamic>? query}) async{
    try {
      final Response response = await dio!.get(endPoint, queryParameters: query);
      return response;
    }catch(e) {
      log("there are error in get request: ${e.toString()}");
      rethrow;
    }
  }

   Future<Response> postRequest({required String endPoint, Map<String, dynamic>? data}) async{
    try {
      final Response response = await dio!.post(endPoint, data: data);
      return response;
    }catch(e) {
      log("there are error in post request: ${e.toString()}");
      rethrow;
    }
  }
   Future<Response> putRequest({required String endPoint, Map<String, dynamic>? data}) async{
     try {
       final Response response = await dio!.put(endPoint, data: data);
       return response;
     }catch(e) {
       log("there are error in post request: ${e.toString()}");
       rethrow;
     }
   }


}
