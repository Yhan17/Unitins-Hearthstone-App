import 'package:dartz/dartz.dart';

import '../core/failures/server_failure.dart';
import '../entities/hero_entity.dart';

abstract class DeckService {
  Future<Either<ServerFailure,List<HeroEntity>>> fetchHeroes(List<String> ids);
}
