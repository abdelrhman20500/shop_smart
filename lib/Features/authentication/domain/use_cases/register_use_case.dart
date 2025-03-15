import 'package:dartz/dartz.dart';
import 'package:shop_smart/Core/base_use_case/base_use_case.dart';
import 'package:shop_smart/Core/error/failure.dart';
import 'package:shop_smart/Features/authentication/domain/entities/auth_entity.dart';
import 'package:shop_smart/Features/authentication/domain/repos/auth_repo.dart';
import 'package:shop_smart/Features/authentication/domain/use_cases/login_use_case.dart';

class RegisterUseCase extends BaseUseCase<AuthEntity, SignInParameters> {
  final AuthRepo authRepo;

  RegisterUseCase(this.authRepo);
  @override
  Future<Either<Failure, AuthEntity>> call(SignInParameters parameters) async {
    return await authRepo.userRegister(parameters);
  }
}
