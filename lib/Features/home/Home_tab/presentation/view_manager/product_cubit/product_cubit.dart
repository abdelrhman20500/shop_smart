import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_smart/Core/base_use_case/base_use_case.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/use_cases/product_use_case.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view_manager/product_cubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productUseCase) : super(ProductInitial());
  final ProductUseCase productUseCase;

  void getProduct() async {
    emit(ProductLoading());
    var result = await productUseCase.call(const NoParameters());
    result.fold((e) {
      emit(ProductFailure(errMessage: e.message));
    }, (productEntity) {
      emit(ProductSuccess(productEntity: productEntity));
    });
  }
}
