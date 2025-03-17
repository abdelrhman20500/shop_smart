import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key,required this.title,required this.image,required this.id,});

  final String title;
  final String image;
  final int id;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){},
      child: Container(
        width: width * 0.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color:
                  Colors.black.withOpacity(0.5), // Shadow color with transparency
              spreadRadius: 1, // How far the shadow spreads
              blurRadius: 5, // The softness of the shadow
              offset: const Offset(2, 2), // Offset of the shadow (x, y)
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(title,maxLines: 1,overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w500, color: Colors.black),),
              SizedBox(height: height * 0.01,),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: image,
                  height: height * 0.07,
                  width: width * 0.2,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      height: height * 0.09,
                      width: width * 0.3,
                      color: Colors.grey[300],
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
