import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/repos/home_repo.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/use_cases/category_id_use_case.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view_manager/category_id_cubit/category_id_state.dart';

class CategoryIdCubit extends Cubit<CategoryIdState>{
  CategoryIdCubit(this.categoryIdUseCase):super(CategoryIdInitial());
  final CategoryIdUseCase categoryIdUseCase;
 
  void categoryId({required int productId})async{
    emit(CategoryIdLoading());
    final parameters = CategoryIdParameters(categoriesId: productId);
    var result = await categoryIdUseCase.call(parameters);
    result.fold((e){
      emit(CategoryIdFailure(errMessage: e.message));
    }, (productEntity){
      emit(CategoryIdSuccess(productEntity: productEntity));
    });
  }
}