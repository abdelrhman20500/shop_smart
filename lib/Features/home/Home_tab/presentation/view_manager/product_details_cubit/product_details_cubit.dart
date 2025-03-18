import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/repos/home_repo.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/use_cases/product_details_use_case.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view_manager/product_details_cubit/product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState>{
  ProductDetailsCubit(this.productDetailsUseCase): super(ProductDetailsInitial());
  final ProductDetailsUseCase productDetailsUseCase;

  void getProductDetails({required int productId})async{
    emit(ProductDetailsLoading());
    final parameters = ProductDetailsParameters(productId: productId);
    final result = await productDetailsUseCase.call(parameters);
    result.fold((e){
      emit(ProductDetailsFailure(errMessage: e.message));
    }, (productDetailsEntity){
      emit(ProductDetailsSuccess(productDetailsEntity: productDetailsEntity));
    });
  }
}