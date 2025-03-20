import 'package:equatable/equatable.dart';

class SearchEntity extends Equatable {
  final int id;
  final double price;
  final String image;
  final String name;
  final String description;
  final bool inFavorites;
  final bool inCart;

  const SearchEntity({
    required this.id,
    required this.price,
    required this.image,
    required this.name,
    required this.description,
    required this.inFavorites,
    required this.inCart,
  });

  @override
  List<Object?> get props =>
      [
        id,
        price,
        image,
        name,
        description,
        inFavorites,
        inCart,
      ];
}
