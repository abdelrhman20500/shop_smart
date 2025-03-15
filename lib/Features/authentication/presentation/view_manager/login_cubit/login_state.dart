import 'package:shop_smart/Features/authentication/domain/entities/auth_entity.dart';

abstract class LoginState{}
class LoginInitial extends LoginState{}
class LoginLoading extends LoginState{}
class LoginFailure extends LoginState{
  final String errMessage;
  LoginFailure({required this.errMessage});
}
class LoginSuccess extends LoginState{
  final AuthEntity authEntity;

  LoginSuccess({required this.authEntity});
}