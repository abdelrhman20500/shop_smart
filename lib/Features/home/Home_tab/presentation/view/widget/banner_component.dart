import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class BannerComponent extends StatelessWidget {
   BannerComponent({super.key});

  final List<String> imageAssets = [
    'assets/images/empty favourite.png',
    'assets/images/empty_orders.png',
    'assets/images/empty1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imageAssets.length,
      itemBuilder: (context, index, realIndex) => Image.asset(
        imageAssets[index],
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width,
      ),
      options: CarouselOptions(
        scrollPhysics: const ScrollPhysics(),
        height: MediaQuery.of(context).size.height*0.3,
        initialPage: 0,
        viewportFraction: 1,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: false,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(seconds: 2),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}