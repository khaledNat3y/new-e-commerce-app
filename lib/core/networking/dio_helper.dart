import 'dart:developer';

import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static Dio? dio;

  static initDio() {
    dio ??= Dio(
        BaseOptions(
          baseUrl: "ApiConstants.apiBaseUrl",
          receiveDataWhenStatusError: true,
        ),
      );

    dio!.interceptors.add(PrettyDioLogger());
  }


}
