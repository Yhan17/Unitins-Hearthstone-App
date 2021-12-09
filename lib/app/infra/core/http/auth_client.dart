import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../env.dart';
import 'interceptors/auth_interceptor.dart';

final authClientProvider = Provider((ref) => AuthClient());

class AuthClient extends DioMixin {
  @override
  HttpClientAdapter get httpClientAdapter => DefaultHttpClientAdapter();

  @override
  BaseOptions get options => BaseOptions(
        baseUrl: Env.authUrl,
      );

  @override
  Interceptors get interceptors => super.interceptors..add(AuthInterceptor());
}
