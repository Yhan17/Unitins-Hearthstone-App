import 'package:equatable/equatable.dart';

import 'card_entity.dart';

import 'hero_power_entity.dart';

class HeroEntity extends Equatable {
  final String name;
  final String image;
  final String className;
  final HeroPowerEntity heroPower;
  final List<CardEntity> cards;

  const HeroEntity({
    required this.name,
    required this.image,
    required this.className,
    required this.heroPower,
    required this.cards,
  });
  @override
  List<Object> get props => [
        name,
        image,
        className,
        heroPower,
        cards,
      ];
}
