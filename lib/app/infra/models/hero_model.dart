import '../../domain/entities/hero_entity.dart';
import 'card_model.dart';
import 'hero_power_model.dart';

class HeroModel {
  final String name;
  final String image;
  final String className;
  final HeroPowerModel heroPower;
  final List<CardModel> cards;
  HeroModel({
    required this.name,
    required this.image,
    required this.className,
    required this.heroPower,
    required this.cards,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'className': className,
      'heroPower': heroPower.toMap(),
      'cards': cards.map((x) => x.toMap()).toList(),
    };
  }

  factory HeroModel.fromMap(Map<String, dynamic> map) {
    return HeroModel(
      name: map['hero']['name'],
      image: map['hero']['image'],
      className: map['class']['name'],
      heroPower: HeroPowerModel.fromMap(map['heroPower']),
      cards: List<CardModel>.from(map['cards']?.map(
        (x) => CardModel.fromMap(x),
      )),
    );
  }

  HeroEntity toEntity() => HeroEntity(
        name: name,
        image: image,
        className: className,
        heroPower: heroPower.toEntity(),
        cards: cards.map((e) => e.toEntity()).toList(),
      );
}
