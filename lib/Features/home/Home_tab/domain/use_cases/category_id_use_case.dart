import 'package:dartz/dartz.dart';
import 'package:shop_smart/Core/base_use_case/base_use_case.dart';
import 'package:shop_smart/Core/error/failure.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/entities/product_entity.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/repos/home_repo.dart';

class CategoryIdUseCase extends BaseUseCase<List<ProductEntity>, CategoryIdParameters> {
  final HomeRepo homeRepo;

  CategoryIdUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<ProductEntity>>> call(CategoryIdParameters parameters) async {
    return await homeRepo.getCategoryId(parameters);
  }
}
