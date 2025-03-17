import 'package:dio/dio.dart';
import 'package:shop_smart/Core/network/api_constant.dart';
import 'package:shop_smart/Features/home/Home_tab/data/models/product_model.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/entities/product_entity.dart';

import '../../../../../Core/error/exception.dart';
import '../../../../../Core/network/error_message_model.dart';
import '../models/banner_model.dart';

abstract class HomeBaseRemoteDataSource {
  Future<List<BannerModel>> getBannerData();
  Future<List<ProductEntity>> getProductData();

}

class HomeRemoteDataSource extends HomeBaseRemoteDataSource {
  @override
  Future<List<BannerModel>> getBannerData() async {
    final response = await Dio(BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
          'lang': 'en',
          // "Authorization":token,
        })).get(ApiConstant.banner);
    if (response.statusCode == 200) {
      // print(response);
      return List<BannerModel>.from((response.data["data"]["banners"] as List)
          .map((e) => BannerModel.fromJson(e)));
    } else {
      {
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }
    }
  }

  @override
  Future<List<ProductEntity>> getProductData()async {
    final response = await Dio(BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
          'lang': 'en',
          // "Authorization":token,
        })).get(ApiConstant.product);
    if (response.statusCode == 200) {
      // print(response);
      return List<ProductModel>.from((response.data["data"]["products"] as List)
          .map((e) => ProductModel.fromJson(e)));
    } else {
      {
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }
    }
  }
}
