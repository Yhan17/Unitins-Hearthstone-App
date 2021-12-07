import '../../domain/entities/card_entity.dart';

class CardModel {
  final String name;
  final String text;
  final String image;

  CardModel({
    required this.name,
    required this.text,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'text': text,
      'image': image,
    };
  }

  factory CardModel.fromMap(Map<String, dynamic> map) {
    return CardModel(
      name: map['name'],
      text: map['text'],
      image: map['image'],
    );
  }

  CardEntity toEntity() => CardEntity(
        name: name,
        text: text,
        image: image,
      );

  factory CardModel.fromEntity(CardEntity entity) {
    return CardModel(
      name: entity.name,
      text: entity.text,
      image: entity.image,
    );
  }
}
