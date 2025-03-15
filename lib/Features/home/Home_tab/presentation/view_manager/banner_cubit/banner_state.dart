import 'package:shop_smart/Features/home/Home_tab/domain/entities/banner_entity.dart';

abstract class BannerState{}
class BannerInitial extends BannerState{}
class BannerLoading extends BannerState{}
class BannerFailure extends BannerState{
  final String errMessage;
  BannerFailure({required this.errMessage});
}
class BannerSuccess extends BannerState{
  final List<BannerEntity> bannerEntity;

  BannerSuccess({required this.bannerEntity});
}