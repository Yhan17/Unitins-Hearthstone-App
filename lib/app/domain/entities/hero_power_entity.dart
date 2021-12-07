import 'package:equatable/equatable.dart';

class HeroPowerEntity extends Equatable {
  final String name;
  final String text;
  final String image;

  const HeroPowerEntity({
    required this.name,
    required this.text,
    required this.image,
  });
  @override
  List<Object> get props => [
        name,
        text,
        image,
      ];
}
