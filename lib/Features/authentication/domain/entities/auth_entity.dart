import 'package:equatable/equatable.dart';
import 'package:shop_smart/Features/authentication/domain/entities/data_entity.dart';

class AuthEntity extends Equatable{
  final bool status;
  final String message;
  final DataEntity? dataEntity;

  const AuthEntity({required this.status, required this.message, required this.dataEntity});


  @override
  // TODO: implement props
  List<Object?> get props => [
    status,
    message,
    dataEntity,
  ];
}