import 'package:shop_smart/Features/home/Home_tab/domain/entities/search_entity.dart';

class SearchModel extends SearchEntity {
  const SearchModel(
      {required super.id,
      required super.price,
      required super.image,
      required super.name,
      required super.description,
      required super.inFavorites,
      required super.inCart});

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
    id: json['id'],
    price: json['price'].toDouble(),
    image: json['image'],
    name: json['name'],
    description: json['description'],
    inFavorites: json['in_favorites'],
    inCart: json['in_cart'],
  );
}
