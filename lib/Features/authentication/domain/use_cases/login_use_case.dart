import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_smart/Core/base_use_case/base_use_case.dart';
import 'package:shop_smart/Core/error/failure.dart';
import 'package:shop_smart/Features/authentication/domain/entities/auth_entity.dart';
import 'package:shop_smart/Features/authentication/domain/repos/auth_repo.dart';

class LoginUseCase extends BaseUseCase<AuthEntity, SignInParameters> {
  final AuthRepo authRepo;

  LoginUseCase(this.authRepo);
  @override
  Future<Either<Failure, AuthEntity>> call(SignInParameters parameters) async {
    return await authRepo.userLogin(parameters);
  }
}

class SignInParameters extends Equatable {
  final Map<String, dynamic> data;

  const SignInParameters(this.data);

  @override
  List<Object?> get props => [data];
}
