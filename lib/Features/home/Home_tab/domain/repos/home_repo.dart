import 'package:dartz/dartz.dart';
import 'package:shop_smart/Core/error/failure.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/entities/banner_entity.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/entities/product_entity.dart';

abstract class HomeRepo{
  Future<Either<Failure, List<BannerEntity>>> getBanner();
  Future<Either<Failure, List<ProductEntity>>> getProduct();

}