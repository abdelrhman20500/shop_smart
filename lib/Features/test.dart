import 'package:flutter/material.dart';
import 'package:shop_smart/Features/home/Home_tab/data/data_sources/home_remote_data_source.dart';
import 'package:shop_smart/Features/home/Home_tab/data/repos/home_repo_impl.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/use_cases/search_use_case.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view_manager/search_cubit/search_cubit.dart';

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
    var result=SearchCubit(SearchUseCase(HomeRepoImpl(homeBaseRemoteDataSource: 
    HomeRemoteDataSource(),),),)..searchProduct(query: "a");
    print(result);
  }
}