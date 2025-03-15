import 'package:dio/dio.dart';
import 'package:shop_smart/Core/network/api_constant.dart';

import '../../../../Core/error/exception.dart';
import '../../../../Core/network/error_message_model.dart';
import '../../domain/use_cases/login_use_case.dart';
import '../../domain/use_cases/register_use_case.dart';
import '../models/auth_model.dart';

abstract class AuthBaseRemoteDataSource {
  Future<AuthModel> login(SignInParameters parameters);

  Future<AuthModel> register(SignUpParameters parameters);
}


class AuthRemoteDataSource extends AuthBaseRemoteDataSource{
  @override
  Future<AuthModel> login(SignInParameters parameters)async{
   final response = await Dio(
     BaseOptions(
       receiveDataWhenStatusError: true,
       baseUrl: ApiConstant.baseUrl,
       headers: {
         'Content-Type': 'application/json',
         'lang': 'en',
       },
     ),
   ).post(ApiConstant.signIn,data:parameters.data);
   if(response.statusCode == 200){
     print(response);
     return AuthModel.fromJson(response.data);
   }else{
     throw ServerException(
       errorMessageModel: ErrorMessageModel.fromJson(response.data),
     );
   }
  }

  @override
  Future<AuthModel> register(SignUpParameters parameters) async{
    final response = await Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: ApiConstant.baseUrl,
        headers: {
          'Content-Type': 'application/json',
          'lang': 'en',
        },
      ),
    ).post(ApiConstant.signUp,data:parameters.data);
    if(response.statusCode == 200){
      print(response);
      return AuthModel.fromJson(response.data);
    }else{
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}