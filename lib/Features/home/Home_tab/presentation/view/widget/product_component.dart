import 'package:flutter/material.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/entities/product_entity.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view/widget/product_item.dart';

class ProductComponent extends StatelessWidget {
  const ProductComponent({super.key, required this.model});

  final List<ProductEntity> model;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, // Allow the GridView to take only the space it needs
      physics: const NeverScrollableScrollPhysics(), // Disable GridView scrolling
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 1.35 / 2.4,
      ),
      itemCount: model.length, // Replace with your actual item count
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: ProductItem(
            id: model[index].id,
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