import 'package:shop_smart/Features/home/Home_tab/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity{
  const CategoryModel({required super.id, required super.title, required super.image});
  factory CategoryModel.fromJson(Map<String, dynamic> json)=>CategoryModel(
      id: json["id"],
      title: json["title"],
      image: json["image"]
  );
}