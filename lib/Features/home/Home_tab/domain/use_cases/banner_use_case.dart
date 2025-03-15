import 'package:dartz/dartz.dart';
import 'package:shop_smart/Core/base_use_case/base_use_case.dart';
import 'package:shop_smart/Core/error/failure.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/entities/banner_entity.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/repos/home_repo.dart';

class BannerUseCase extends BaseUseCase<List<BannerEntity>, NoParameters> {
  final HomeRepo homeRepo;

  BannerUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<BannerEntity>>> call(NoParameters parameters) async {
    return await homeRepo.getBanner();
  }
}
