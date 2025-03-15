import 'package:dartz/dartz.dart';
import 'package:shop_smart/Core/error/failure.dart';
import 'package:shop_smart/Features/home/Home_tab/data/data_sources/home_remote_data_source.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/entities/banner_entity.dart';
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

}