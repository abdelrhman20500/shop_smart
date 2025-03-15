import 'package:shop_smart/Features/authentication/domain/entities/data_entity.dart';

class DataModel extends DataEntity {
  const DataModel({
    required int id,
    required String name,
    required String email,
    required String phone,
    required String image,
    int? points,
    double? credit,
    required String token,
  }) : super(
    id: id,
    name: name,
    email: email,
    phone: phone,
    image: image,
    points: points,
    credit: credit,
    token: token,
  );

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      points: json['points'],
      credit: json['credit'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'image': image,
      'points': points,
      'credit': credit,
      'token': token,
    };
  }
}