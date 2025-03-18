import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shop_smart/Features/home/Home_tab/domain/entities/product_details_entity.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../Core/utils/app_color.dart';

class BuildProductDetailsItem extends StatelessWidget {
   BuildProductDetailsItem({super.key, required this.model});

  final ProductDetailsEntity model;
  final PageController boardController = PageController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: height * 0.5,
            color: AppColors.myWhite,
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              onPageChanged: (int index) {},
              controller: boardController,
              itemBuilder: (context, index) => ClipRRect(
                borderRadius: BorderRadius.circular(12), // Optional: add rounded corners
                child: CachedNetworkImage(
                  imageUrl: model.images[index],
                  width: double.infinity,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      color: Colors.white,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
              itemCount: model.images.length,
            ),
          ),
          SizedBox(height: height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SmoothPageIndicator(
                controller: boardController,
                effect: ExpandingDotsEffect(
                  dotColor: AppColors.primaryColor,
                  activeDotColor: AppColors.textBodyMediumColor,
                  dotHeight: 10,
                  expansionFactor: 4,
                  dotWidth: 10,
                  spacing: 5,
                ),
                count: model.images.length,
              ),
            ],
          ),
          SizedBox(height: height * 0.01),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(model.name, maxLines: 3, overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                    ),
                    Text(model.price.toString(),
                      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
                Text(model.description,
                  style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 16, fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}