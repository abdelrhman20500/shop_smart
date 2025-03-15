import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_smart/Core/base_use_case/base_use_case.dart';
import 'package:shop_smart/Core/error/failure.dart';
import 'package:shop_smart/Features/authentication/domain/entities/auth_entity.dart';
import 'package:shop_smart/Features/authentication/domain/repos/auth_repo.dart';

class RegisterUseCase extends BaseUseCase<AuthEntity, SignUpParameters> {
  final AuthRepo authRepo;

  RegisterUseCase(this.authRepo);
  @override
  Future<Either<Failure, AuthEntity>> call(SignUpParameters parameters) async {
    return await authRepo.userRegister(parameters);
  }
}

class SignUpParameters extends Equatable {
  final Map<String, dynamic> data;

  const SignUpParameters(this.data);

  @override
  List<Object?> get props => [
        data,
      ];
}
