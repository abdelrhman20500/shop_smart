import 'package:flutter/material.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view/widget/product_item.dart';

class ProductComponent extends StatelessWidget {
  const ProductComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, // Allow the GridView to take only the space it needs
      physics: const NeverScrollableScrollPhysics(), // Disable GridView scrolling
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 1.62 / 2.4,
      ),
      itemCount: 10, // Replace with your actual item count
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.all(4.0),
          child: ProductItem(),
        );
      },
    );
  }
}