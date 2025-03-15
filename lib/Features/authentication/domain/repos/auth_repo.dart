import 'package:dartz/dartz.dart';
import 'package:shop_smart/Core/error/failure.dart';
import 'package:shop_smart/Features/authentication/domain/entities/auth_entity.dart';
import 'package:shop_smart/Features/authentication/domain/use_cases/register_use_case.dart';
import '../use_cases/login_use_case.dart';

abstract class AuthRepo{
  Future<Either<Failure, AuthEntity>> userLogin(SignInParameters parameters);
  Future<Either<Failure, AuthEntity>> userRegister(SignUpParameters parameters);

}


