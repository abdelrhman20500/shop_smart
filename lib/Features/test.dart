import 'package:flutter/material.dart';
import 'package:shop_smart/Features/home/Home_tab/data/data_sources/home_remote_data_source.dart';
import 'package:shop_smart/Features/home/Home_tab/data/repos/home_repo_impl.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/use_cases/category_use_case.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/use_cases/product_use_case.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view_manager/category_cubit/category_cubit.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view_manager/product_cubit/product_cubit.dart';

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
    var result= CategoryCubit(CategoryUseCase(HomeRepoImpl(homeBaseRemoteDataSource: HomeRemoteDataSource(),),),
    )..getCategory();
  }
}