
import 'package:dartz/dartz.dart';
import '../core/failures/server_failure.dart';

abstract class AuthService {
  Future<Either<ServerFailure,Unit>> getAuthorizationCode();
}