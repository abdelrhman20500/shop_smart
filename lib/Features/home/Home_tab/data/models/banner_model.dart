import 'package:shop_smart/Features/home/Home_tab/domain/entities/banner_entity.dart';

class BannerModel extends BannerEntity{
  const BannerModel({required super.image, required super.id});
  factory BannerModel.fromJson(Map<String, dynamic> json)=>BannerModel(
      image: json["image"],
      id: json["id"]
  );
}