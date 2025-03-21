import 'package:dio/dio.dart';
import 'package:shop_smart/Core/network/api_constant.dart';
import 'package:shop_smart/Features/home/Home_tab/data/models/category_model.dart';
import 'package:shop_smart/Features/home/Home_tab/data/models/product_details_model.dart';
import 'package:shop_smart/Features/home/Home_tab/data/models/product_model.dart';
import 'package:shop_smart/Features/home/Home_tab/data/models/search_model.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/entities/product_entity.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/repos/home_repo.dart';
import '../../../../../Core/error/exception.dart';
import '../../../../../Core/network/error_message_model.dart';
import '../models/banner_model.dart';

abstract class HomeBaseRemoteDataSource {
  Future<List<BannerModel>> getBannerData();
  Future<List<ProductEntity>> getProductData();
  Future<List<CategoryModel>> getCategoryData();
  Future<List<ProductModel>> getCategoryId(CategoryIdParameters parameters);
  Future<ProductDetailsModel> getProductDetails(ProductDetailsParameters parameters);
  Future<List<SearchModel>> searchAboutItem(SearchParameters parameters);
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

  @override
  Future<List<CategoryModel>> getCategoryData() async{
    final response = await Dio(BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
          'lang': 'en',
          // "Authorization":token,
        })).get(ApiConstant.categories);
    if (response.statusCode == 200) {
      // print(response);
      return List<CategoryModel>.from((response.data["data"]["data"] as List)
          .map((e) => CategoryModel.fromJson(e)));
    } else {
      {
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }
    }
  }

  @override
  Future<List<ProductModel>> getCategoryId(CategoryIdParameters parameters)async{
    final response = await Dio(BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
          'lang': 'en',
          // "Authorization":token,
        })).get(ApiConstant.getCategoriesDetails(parameters.categoriesId));
    if (response.statusCode == 200) {
      // print(response);
      return List<ProductModel>.from((response.data["data"]["data"] as List)
          .map((e) => ProductModel.fromJson(e)));
    } else {
      {
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }
    }
  }

  @override
  Future<ProductDetailsModel> getProductDetails(ProductDetailsParameters parameters)async{
    final response = await Dio(BaseOptions(
        baseUrl: ApiConstant.baseUrl,
        receiveDataWhenStatusError: true,
        headers: {
          'Content-Type': 'application/json',
          'lang': 'en',
          // "Authorization":token,
        })).get(ApiConstant.getProductDetails(parameters.productId));
    if (response.statusCode == 200) {
      // print(response);
      return ProductDetailsModel.fromJson(response.data["data"]);
    } else {
      {
        throw ServerException(
            errorMessageModel: ErrorMessageModel.fromJson(response.data));
      }
    }
  }

  @override
  Future<List<SearchModel>> searchAboutItem(SearchParameters parameters) async
  {
    final response = await Dio(BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: ApiConstant.baseUrl,
        headers:
        {
          'Content-Type': 'application/json',
          'lang': 'en',
          // "Authorization":token,
        }
    )).post(ApiConstant.search, data: {
      'text': parameters.text,
    } );
    print(response);

    if(response.data['status'])
    {
      print('Search  ********************************');
      return List<SearchModel>.from((response.data['data']['data'] as List).map((e) => SearchModel.fromJson(e)));
    }else
    {
      throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }


}
