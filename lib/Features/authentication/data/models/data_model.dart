import 'package:shop_smart/Features/authentication/domain/entities/data_entity.dart';

class DataModel extends DataEntity {
  const DataModel({
    required super.id,
    required super.name,
    required super.email,
    required super.phone,
    required super.image,
    super.points,
    super.credit,
    required super.token,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      image: json['image'],
      points: json['points'],
      credit: (json['credit'] is int) ? (json['credit'] as int).toDouble() : json['credit']?.toDouble(),
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