import 'package:flutter/material.dart';
import 'package:shop_smart/Features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:shop_smart/Features/authentication/data/repos/auth_repo_impl.dart';
import 'package:shop_smart/Features/authentication/domain/use_cases/login_use_case.dart';
import 'package:shop_smart/Features/authentication/presentation/view_manager/login_cubit/login_cubit.dart';

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
    var result= LoginCubit(LoginUseCase(AuthRepoImpl(authBaseRemoteDataSource: AuthRemoteDataSource(),),),
    )..login(email: "nader321@gmail.com", password: "Nader#123");
  }
}