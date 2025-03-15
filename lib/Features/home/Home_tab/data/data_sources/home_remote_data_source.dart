import 'package:dio/dio.dart';
import 'package:shop_smart/Core/network/api_constant.dart';

import '../../../../../Core/error/exception.dart';
import '../../../../../Core/network/error_message_model.dart';
import '../models/banner_model.dart';

abstract class HomeBaseRemoteDataSource {
  Future<List<BannerModel>> getBannerData();
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
      return List<BannerModel>.from((response.data["data"]["banners"] as List)
          .map((e) => BannerModel.fromJson(e)));
    } else {
      {
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }
    }
  }
}
