import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../env.dart';

final authClientProvider = Provider((ref) => AuthClient());

class AuthClient extends DioMixin {
  
  @override
  HttpClientAdapter get httpClientAdapter => DefaultHttpClientAdapter();

  @override
  BaseOptions get options => BaseOptions(
        baseUrl: Env.apiUrl,
        headers: {
          'content-length': '5009',
          'content-type': 'application/json; charset=utf-8',
          'etag': 'W/"4910-CjhEn0j21foncrs7XD8aDAjlJVQ"'
        },
      );
}