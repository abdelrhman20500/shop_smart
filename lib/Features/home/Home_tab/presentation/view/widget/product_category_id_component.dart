import 'package:flutter/material.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/entities/product_entity.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view/widget/product_item.dart';

class ProductCategoryIdComponent extends StatelessWidget {
  const ProductCategoryIdComponent({super.key, required this.model});

  final List<ProductEntity> model;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const AlwaysScrollableScrollPhysics(), // Enable scrolling
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 1.35 / 2.4,
      ),
      itemCount: model.length, // Use your actual item count
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: ProductItem(
            image: model[index].image,
            name: model[index].name,
            description: model[index].description,
            price: model[index].price,
          ),
        );
      },
    );
  }
}