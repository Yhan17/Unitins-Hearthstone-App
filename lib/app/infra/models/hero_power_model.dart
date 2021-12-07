import '../../domain/entities/hero_power_entity.dart';

class HeroPowerModel {
  final String name;
  final String text;
  final String image;
  HeroPowerModel({
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

  factory HeroPowerModel.fromMap(Map<String, dynamic> map) {
    return HeroPowerModel(
      name: map['name'],
      text: map['text'],
      image: map['image'],
    );
  }

  HeroPowerEntity toEntity() => HeroPowerEntity(
        name: name,
        text: text,
        image: image,
      );

  factory HeroPowerModel.fromEntity(HeroPowerEntity entity) {
    return HeroPowerModel(
      name: entity.name,
      text: entity.text,
      image: entity.image,
    );
  }
}
