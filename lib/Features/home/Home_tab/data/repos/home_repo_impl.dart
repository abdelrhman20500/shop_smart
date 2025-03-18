import 'package:dartz/dartz.dart';
import 'package:shop_smart/Core/error/failure.dart';
import 'package:shop_smart/Features/home/Home_tab/data/data_sources/home_remote_data_source.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/entities/banner_entity.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/entities/category_entity.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/entities/product_entity.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/repos/home_repo.dart';

import '../../../../../Core/error/exception.dart';

class HomeRepoImpl extends HomeRepo{
  final HomeBaseRemoteDataSource homeBaseRemoteDataSource;

  HomeRepoImpl({required this.homeBaseRemoteDataSource});
  @override
  Future<Either<Failure, List<BannerEntity>>> getBanner()async{
    try {
      final result = await homeBaseRemoteDataSource.getBannerData();
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProduct()async{
    try {
      final result = await homeBaseRemoteDataSource.getProductData();
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategory()async{
    try {
      final result = await homeBaseRemoteDataSource.getCategoryData();
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getCategoryId(CategoryIdParameters parameters)async{
    try {
      final result = await homeBaseRemoteDataSource.getCategoryId(parameters);
      return right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message));
    }
  }

}