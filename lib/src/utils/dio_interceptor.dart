import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BaseInterceptor implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint("[${err.message}][${err.response?.statusCode}][]");
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("[${options.method}][${options.data}][${options.headers}]");
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("[${response.statusCode}][${response.data}]");
    handler.next(response);
  }
}
