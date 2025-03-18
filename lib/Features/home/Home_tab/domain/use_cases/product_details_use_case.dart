import 'package:dartz/dartz.dart';
import 'package:shop_smart/Core/base_use_case/base_use_case.dart';
import 'package:shop_smart/Core/error/failure.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/entities/product_details_entity.dart';

import '../repos/home_repo.dart';

class ProductDetailsUseCase extends BaseUseCase<ProductDetailsEntity, ProductDetailsParameters>{
  final HomeRepo homeRepo;

  ProductDetailsUseCase(this.homeRepo);
  @override
  Future<Either<Failure, ProductDetailsEntity>> call(ProductDetailsParameters parameters)async{
    return await homeRepo.getProductDetails(parameters);
  }
}