import 'package:flutter/material.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/entities/category_entity.dart';

import 'category_item.dart';


class CategoriesComponent extends StatelessWidget {
  const CategoriesComponent({super.key, required this.model});

  final List<CategoryEntity> model;

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return SizedBox(
      height: height*0.16,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:model.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CategoryItem(
              title: model[index].name,
              image: model[index].image,
              id: model[index].id,
            ),
          );
        },
      ),
    );
  }
}

