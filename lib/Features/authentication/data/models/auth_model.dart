import 'package:shop_smart/Features/authentication/domain/entities/auth_entity.dart';

import 'data_model.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required super.status,
    required super.message,
    required DataModel? super.dataEntity,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      status: json['status'],
      message: json['message'],
      dataEntity: json['data'] != null ? DataModel.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': dataEntity,
    };
  }
}