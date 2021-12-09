import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/core/failures/server_failure.dart';
import '../../domain/services/auth_service.dart';
import '../core/http/auth_client.dart';

final authServiceProvider = Provider<AuthService>(
  (ref) => AuthServiceImpl(ref.read(authClientProvider)),
);

class AuthServiceImpl extends AuthService {
  final AuthClient client;

  AuthServiceImpl(this.client);
  @override
  Future<Either<ServerFailure, Unit>> getAuthorizationCode() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final result = await client.post(
        '/token',
        data: {
          'grant_type': 'client_credentials',
        },
        options: Options(contentType: Headers.formUrlEncodedContentType),
      );

      prefs.setString('token', result.data['access_token']);
      prefs.setInt('expires_in', result.data['expires_in']);
      prefs.setString('token_creation', DateTime.now().toString());

      return right(unit);
    } on DioError {
      return left(ServerFailure.serverError);
    }
  }
}
