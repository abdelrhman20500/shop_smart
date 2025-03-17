import 'package:dartz/dartz.dart';
import 'package:shop_smart/Core/base_use_case/base_use_case.dart';
import 'package:shop_smart/Core/error/failure.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/entities/product_entity.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/repos/home_repo.dart';

class ProductUseCase extends BaseUseCase<List<ProductEntity>, NoParameters> {
  final HomeRepo homeRepo;

  ProductUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<ProductEntity>>> call(NoParameters parameters) async {
    return await homeRepo.getProduct();
  }
}
