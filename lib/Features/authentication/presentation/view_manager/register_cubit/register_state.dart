import 'package:shop_smart/Features/authentication/domain/entities/auth_entity.dart';

abstract class RegisterState{}
class RegisterInitial extends RegisterState{}
class RegisterLoading extends RegisterState{}
class RegisterFailure extends RegisterState{
  final String errMessage;
  RegisterFailure({required this.errMessage});
}
class RegisterSuccess extends RegisterState{
  final AuthEntity authEntity;

  RegisterSuccess({required this.authEntity});
}