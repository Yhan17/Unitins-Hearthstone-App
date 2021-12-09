import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../env.dart';
import 'interceptors/hearthstone_interceptor.dart';

final hearthstoneClientProvider = Provider((ref) => HearthstoneClient());

class HearthstoneClient extends DioMixin {
  @override
  HttpClientAdapter get httpClientAdapter => DefaultHttpClientAdapter();

  @override
  BaseOptions get options => BaseOptions(
        baseUrl: Env.apiUrl,
      );

  @override
  Interceptors get interceptors => super.interceptors..add(HarthstoneInterceptor());
}
