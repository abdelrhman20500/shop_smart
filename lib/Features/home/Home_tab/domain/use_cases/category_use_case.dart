import 'package:dartz/dartz.dart';
import 'package:shop_smart/Core/base_use_case/base_use_case.dart';
import 'package:shop_smart/Core/error/failure.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/entities/category_entity.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/repos/home_repo.dart';

class CategoryUseCase extends BaseUseCase<List<CategoryEntity>, NoParameters> {
  final HomeRepo homeRepo;

  CategoryUseCase(this.homeRepo);
  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParameters parameters) async {
    return await homeRepo.getCategory();
  }
}
