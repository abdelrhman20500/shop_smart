import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_smart/Features/home/Home_tab/data/data_sources/home_remote_data_source.dart';
import 'package:shop_smart/Features/home/Home_tab/data/repos/home_repo_impl.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/use_cases/category_id_use_case.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view/widget/product_category_id_component.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view_manager/category_id_cubit/category_id_cubit.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view_manager/category_id_cubit/category_id_state.dart';

class ProductByCategoryId extends StatelessWidget {
  const ProductByCategoryId({super.key, required this.productId, required this.titleCategory});

  final int productId;
  final String titleCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: ()
        {
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios, color: Colors.black,)),
        centerTitle: true,
        title: Text(titleCategory, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),),
      ),
      body: BlocProvider(
        create: (context) => CategoryIdCubit(CategoryIdUseCase(HomeRepoImpl(homeBaseRemoteDataSource:
        HomeRemoteDataSource(),),),)..categoryId(productId: productId),
        child: BlocBuilder<CategoryIdCubit, CategoryIdState>(
          builder: (context, state) {
            if(state is CategoryIdLoading){
              return const Center(child:  CircularProgressIndicator(),);
            }else if(state is CategoryIdFailure){
              // print(state.errMessage);
            }else if(state is CategoryIdSuccess){
              if (state.productEntity.isEmpty) {
                return const EmptyProduct();
              } else {
                return ProductCategoryIdComponent(model: state.productEntity);
              }            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class EmptyProduct extends StatelessWidget {
  const EmptyProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Empty Product...",
    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),));
  }
}
