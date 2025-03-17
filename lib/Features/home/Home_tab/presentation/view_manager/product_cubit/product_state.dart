import 'package:shop_smart/Features/home/Home_tab/domain/entities/product_entity.dart';

abstract class ProductState{}
class ProductInitial extends ProductState{}
class ProductLoading extends ProductState{}
class ProductFailure extends ProductState{
  final String errMessage;
  ProductFailure({required this.errMessage});
}
class ProductSuccess extends ProductState{
  final List<ProductEntity> productEntity;

  ProductSuccess({required this.productEntity});
}