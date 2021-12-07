import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/core/failures/server_failure.dart';
import '../../../domain/entities/hero_entity.dart';
import '../../../domain/services/deck_service.dart';
import '../../../infra/services/deck_service_impl.dart';
import '../../core/common_state/common_state.dart';

typedef DeckState = CommonState<ServerFailure, List<HeroEntity>>;

class DeckNotifier extends StateNotifier<DeckState> {
  final DeckService service;
  DeckNotifier(this.service) : super(const DeckState.initial());

  Future<void> getToken(List<String> ids) async {
    state = const DeckState.loadInProgress();
    final result = await service.fetchHeroes(ids);

    result.fold(
      (l) => state = DeckState.loadFailure(l),
      (r) => state = DeckState.loadSuccess(r),
    );
  }
}

final deckNotifierProvider =
    StateNotifierProvider.autoDispose<DeckNotifier, DeckState>(
  (ref) => DeckNotifier(ref.read(deckServiceProvider)),
);
