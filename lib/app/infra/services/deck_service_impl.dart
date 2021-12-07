import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/core/failures/server_failure.dart';
import '../../domain/entities/hero_entity.dart';
import '../../domain/services/deck_service.dart';
import '../core/http/hearthstone_client.dart';
import '../models/hero_model.dart';

final deckServiceProvider = Provider<DeckService>(
  (ref) => DeckServiceImpl(ref.read(hearthstoneClientProvider)),
);
class DeckServiceImpl extends DeckService {
  final HearthstoneClient client;

  DeckServiceImpl(this.client);
  @override
  Future<Either<ServerFailure, List<HeroEntity>>> fetchHeroes(
    List<String> ids,
  ) async {
    try {
      final List<HeroEntity> list = [];

      for (var id in ids) {
        final result = await client.get('/decks', queryParameters: {
          'region': 'us',
          'locale': 'en_US',
          'code': id,
        });

        final hero = HeroModel.fromMap(result.data).toEntity();
        list.add(hero);
      }
      return right(list);
    } on DioError {
      return left(ServerFailure.serverError);
    }
  }
}
