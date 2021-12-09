import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../../env.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Authorization'] = 'Basic ' +
        base64Encode(
          utf8.encode('${Env.clientId}:${Env.clientSecret}'),
        );

    super.onRequest(options, handler);
  }
}
