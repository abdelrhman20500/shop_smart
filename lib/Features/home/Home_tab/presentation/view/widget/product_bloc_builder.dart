import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_smart/Features/home/Home_tab/data/data_sources/home_remote_data_source.dart';
import 'package:shop_smart/Features/home/Home_tab/data/repos/home_repo_impl.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/use_cases/product_use_case.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view/widget/product_component.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view_manager/product_cubit/product_cubit.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view_manager/product_cubit/product_state.dart';

class ProductBlocBuilder extends StatelessWidget {
  const ProductBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
       create: (context) => ProductCubit(ProductUseCase(HomeRepoImpl(homeBaseRemoteDataSource:
       HomeRemoteDataSource(),),),)..getProduct(),
      child: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if(state is ProductLoading){
            return const Center(child:  CircularProgressIndicator(),);
          }else if(state is ProductFailure){
            // print(state.errMessage);
          }else if(state is ProductSuccess){
            return ProductComponent(model: state.productEntity,);
          }
          return const SizedBox();
        },
      ),
    );
  }
}
