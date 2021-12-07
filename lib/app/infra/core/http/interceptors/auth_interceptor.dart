import 'package:dio/dio.dart';

import '../../../../../env.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.data = {
      'auth': {
        'username': Env.clientId,
        'password': Env.clientSecret,
      }
    };

    super.onRequest(options, handler);
  }
}
