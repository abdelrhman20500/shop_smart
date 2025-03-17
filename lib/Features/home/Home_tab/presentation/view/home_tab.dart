import 'package:flutter/material.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view/widget/banner_component.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view/widget/build_home_search.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view/widget/category_bloc_builder.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view/widget/product_bloc_builder.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: height*0.035,),
            const BuildHomeSearch(),
            SizedBox(height: height*0.035,),
            const BannerComponent(),
            SizedBox(height: height*0.02,),
            const Text("Categories", style:
            TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
            const CategoryBlocBuilder(),
            SizedBox(height: height*0.02,),
            const Text("New Products", style:
            TextStyle(fontSize: 24, fontWeight: FontWeight.w600),),
            const ProductBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
