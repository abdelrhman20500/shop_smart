import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_smart/Features/home/Home_tab/data/data_sources/home_remote_data_source.dart';
import 'package:shop_smart/Features/home/Home_tab/data/repos/home_repo_impl.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/use_cases/category_use_case.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view_manager/category_cubit/category_cubit.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view_manager/category_cubit/category_state.dart';

import 'categories_component.dart';

class CategoryBlocBuilder extends StatelessWidget {
  const CategoryBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(CategoryUseCase(HomeRepoImpl(
        homeBaseRemoteDataSource: HomeRemoteDataSource(),),),
      )..getCategory(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (BuildContext context, state) {
          if (state is CategoryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CategoryFailure) {
            print(state.errMessage);
          } else if (state is CategorySuccess) {
            return CategoriesComponent(model: state.categoryEntity);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
