import 'package:flutter/material.dart';
import 'package:shop_smart/Features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:shop_smart/Features/authentication/data/repos/auth_repo_impl.dart';
import 'package:shop_smart/Features/authentication/domain/use_cases/register_use_case.dart';
import 'package:shop_smart/Features/authentication/presentation/view_manager/register_cubit/register_cubit.dart';
import 'package:shop_smart/Features/home/Home_tab/data/data_sources/home_remote_data_source.dart';
import 'package:shop_smart/Features/home/Home_tab/data/repos/home_repo_impl.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/use_cases/banner_use_case.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view_manager/banner_cubit/banner_cubit.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  void getData(){
    var result= BannerCubit(BannerUseCase(HomeRepoImpl(homeBaseRemoteDataSource: HomeRemoteDataSource(),),),
    )..getBanner();
  }
}