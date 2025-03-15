import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_smart/Features/home/Home_tab/data/data_sources/home_remote_data_source.dart';
import 'package:shop_smart/Features/home/Home_tab/data/repos/home_repo_impl.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/use_cases/banner_use_case.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view_manager/banner_cubit/banner_cubit.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view_manager/banner_cubit/banner_state.dart';

class BannerComponent extends StatelessWidget {
   const BannerComponent({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BannerCubit(BannerUseCase(HomeRepoImpl(
          homeBaseRemoteDataSource: HomeRemoteDataSource(),),),
      )..getBanner(),
      child: BlocBuilder<BannerCubit, BannerState>(
        builder: (BuildContext context, BannerState state) {
          if(state is BannerLoading)
            {
              return const Center(child: CircularProgressIndicator());
            }else if(state is BannerFailure)
              {
                // print(state.errMessage);
              }else if(state is BannerSuccess)
                {
                  return CarouselSlider.builder(
                    itemCount: state.bannerEntity.length,
                    itemBuilder: (context, index, realIndex) => Image.network(
                      state.bannerEntity[index].image,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    ),
                    options: CarouselOptions(
                      scrollPhysics: const ScrollPhysics(),
                      height: MediaQuery.of(context).size.height*0.3,
                      initialPage: 0,
                      viewportFraction: 1,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayAnimationDuration: const Duration(seconds: 2),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal,
                    ),
                  );
                }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}