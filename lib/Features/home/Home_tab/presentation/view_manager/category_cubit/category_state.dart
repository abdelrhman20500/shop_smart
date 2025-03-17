import 'package:shop_smart/Features/home/Home_tab/domain/entities/category_entity.dart';

abstract class CategoryState{}
class CategoryInitial extends CategoryState{}
class CategoryLoading extends CategoryState{}
class CategoryFailure extends CategoryState{
  final String errMessage;
  CategoryFailure({required this.errMessage});
}
class CategorySuccess extends CategoryState{
  final List<CategoryEntity> categoryEntity;
  CategorySuccess({required this.categoryEntity});
}