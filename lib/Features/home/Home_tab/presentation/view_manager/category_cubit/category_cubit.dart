import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_smart/Core/base_use_case/base_use_case.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/use_cases/category_use_case.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view_manager/category_cubit/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit(this.categoryUseCase) : super(CategoryInitial());
  final CategoryUseCase categoryUseCase;

  void getCategory() async {
    emit(CategoryLoading());
    var result = await categoryUseCase.call(const NoParameters());
    result.fold((e) {
      emit(CategoryFailure(errMessage: e.message));
    }, (categoryEntity) {
      emit(CategorySuccess(categoryEntity: categoryEntity));
    });
  }
}
