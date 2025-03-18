import 'package:flutter/material.dart';
import 'package:shop_smart/Features/home/Home_tab/data/data_sources/home_remote_data_source.dart';
import 'package:shop_smart/Features/home/Home_tab/data/repos/home_repo_impl.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/use_cases/category_id_use_case.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view_manager/category_id_cubit/category_id_cubit.dart';

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
    var result=CategoryIdCubit(CategoryIdUseCase(HomeRepoImpl(homeBaseRemoteDataSource: 
    HomeRemoteDataSource(),),),)..categoryId(productId: 44);
  }
}