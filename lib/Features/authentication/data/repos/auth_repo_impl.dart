import 'package:dartz/dartz.dart';
import 'package:shop_smart/Core/error/failure.dart';
import 'package:shop_smart/Features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:shop_smart/Features/authentication/domain/entities/auth_entity.dart';
import 'package:shop_smart/Features/authentication/domain/repos/auth_repo.dart';
import 'package:shop_smart/Features/authentication/domain/use_cases/login_use_case.dart';
import 'package:shop_smart/Features/authentication/domain/use_cases/register_use_case.dart';
import '../../../../Core/error/exception.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthBaseRemoteDataSource authBaseRemoteDataSource;

  AuthRepoImpl({required this.authBaseRemoteDataSource});
  @override
  Future<Either<Failure, AuthEntity>> userLogin(
      SignInParameters parameters) async {
    try {
      final result = await authBaseRemoteDataSource.login(parameters);
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, AuthEntity>> userRegister(
      SignUpParameters parameters) async {
    try {
      final result = await authBaseRemoteDataSource.register(parameters);
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }
}
