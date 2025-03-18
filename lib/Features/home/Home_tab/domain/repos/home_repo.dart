import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_smart/Core/error/failure.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/entities/banner_entity.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/entities/category_entity.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/entities/product_details_entity.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/entities/product_entity.dart';

abstract class HomeRepo{
  Future<Either<Failure, List<BannerEntity>>> getBanner();
  Future<Either<Failure, List<ProductEntity>>> getProduct();
  Future<Either<Failure, List<CategoryEntity>>> getCategory();
  Future<Either<Failure,List<ProductEntity>>> getCategoryId(CategoryIdParameters parameters);
  Future<Either<Failure,ProductDetailsEntity>> getProductDetails(ProductDetailsParameters parameters);

}


/// Category Id Parameters...
class CategoryIdParameters extends Equatable
{
  final int categoriesId;

  const CategoryIdParameters({required this.categoriesId});

  @override
  List<Object?> get props => [categoriesId];
}


/// Product Details Parameters...
class ProductDetailsParameters extends Equatable
{
  final int productId;

  const ProductDetailsParameters({required this.productId});

  @override
  List<Object?> get props => [productId];
}