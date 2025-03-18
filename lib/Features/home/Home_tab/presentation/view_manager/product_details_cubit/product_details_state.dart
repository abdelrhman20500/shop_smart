import 'package:shop_smart/Features/home/Home_tab/domain/entities/product_details_entity.dart';

abstract class ProductDetailsState{}
class ProductDetailsInitial extends ProductDetailsState{}
class ProductDetailsLoading extends ProductDetailsState{}
class ProductDetailsFailure extends ProductDetailsState{
  final String errMessage;

  ProductDetailsFailure({required this.errMessage});
}
class ProductDetailsSuccess extends ProductDetailsState{
  final ProductDetailsEntity productDetailsEntity;

  ProductDetailsSuccess({required this.productDetailsEntity});
}