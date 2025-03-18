import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_smart/Features/home/Home_tab/data/data_sources/home_remote_data_source.dart';
import 'package:shop_smart/Features/home/Home_tab/data/repos/home_repo_impl.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/use_cases/product_details_use_case.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view/widget/build_product_details_item.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view_manager/product_details_cubit/product_details_cubit.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view_manager/product_details_cubit/product_details_state.dart';


class ProductDetails extends StatelessWidget {
   const ProductDetails({super.key, required this.productId});

   final int productId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back_ios, size: 30, color: Colors.black,)),
        centerTitle: true,
        title:const Text('Product Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
      ),
      body: BlocProvider(
        create: (context) => ProductDetailsCubit(ProductDetailsUseCase(HomeRepoImpl(homeBaseRemoteDataSource:
        HomeRemoteDataSource(),),),)..getProductDetails(productId: productId),
        child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            if(state is ProductDetailsLoading)
              {
                return const Center(child: CircularProgressIndicator(),);
              }else if(state is ProductDetailsFailure){
              print(state.errMessage);
            }else if(state is ProductDetailsSuccess){
              return BuildProductDetailsItem(model: state.productDetailsEntity,);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

