import 'package:shop_smart/Features/home/Home_tab/domain/entities/product_entity.dart';

abstract class CategoryIdState{}
class CategoryIdInitial extends CategoryIdState{}
class CategoryIdLoading extends CategoryIdState{}
class CategoryIdFailure extends CategoryIdState{
  final String errMessage;

  CategoryIdFailure({required this.errMessage});
}
class CategoryIdSuccess extends CategoryIdState{
  final List<ProductEntity> productEntity;

  CategoryIdSuccess({required this.productEntity});
}