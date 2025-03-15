import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_smart/Core/base_use_case/base_use_case.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/use_cases/banner_use_case.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view_manager/banner_cubit/banner_state.dart';

class BannerCubit extends Cubit<BannerState> {
  BannerCubit(this.bannerUseCase) : super(BannerInitial());
  final BannerUseCase bannerUseCase;

  void getBanner() async {
    emit(BannerLoading());
    var result = await bannerUseCase.call(const NoParameters());
    result.fold((e) {
      emit(BannerFailure(errMessage: e.message));
    }, (bannerEntity) {
      emit(BannerSuccess(bannerEntity: bannerEntity));
    });
  }
}
