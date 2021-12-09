import 'package:dartz/dartz.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/core/failures/server_failure.dart';
import '../../../domain/services/auth_service.dart';
import '../../../infra/services/auth_service_impl.dart';
import '../../core/common_state/common_state.dart';

typedef AuthState = CommonState<ServerFailure, Unit>;

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService service;
  AuthNotifier(this.service) : super(const AuthState.initial());

  AuthState get last => state;

  Future<void> getToken() async {
    state = const AuthState.loadInProgress();
    final result = await service.getAuthorizationCode();

    result.fold(
      (l) => state = AuthState.loadFailure(l),
      (r) => state = AuthState.loadSuccess(r),
    );
  }
}

final authNotifierProvider =
    StateNotifierProvider.autoDispose<AuthNotifier, AuthState>(
  (ref) => AuthNotifier(ref.read(authServiceProvider)),
);
