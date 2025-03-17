import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.image, required this.name, required this.price, required this.description});

  final String image;
  final String name;
  final String description;
  final double price;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5), // Shadow color with transparency
            spreadRadius: 1, // How far the shadow spreads
            blurRadius: 5,   // The softness of the shadow
            offset: const Offset(2, 2), // Offset of the shadow (x, y)
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.cover,
                    height: height * 0.2, // Set the height as a fraction of the screen height
                    width: double.infinity, // Make the width fill the container
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey[700]!,
                      highlightColor: Colors.grey[500]!,
                      child: Container(
                        height: height * 0.2,
                        width: double.infinity,
                        color: Colors.grey,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                Positioned(
                  top: 4.0,
                  right: 4.0,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300, // Background color of the circle
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(onPressed: (){}, icon: const Icon(Icons.favorite_border, color: Colors.blue, size: 28,)),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.01),
            Text(name,maxLines: 1,overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
            SizedBox(height: height * 0.01),
            Text(description,maxLines: 2,overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.grey, fontSize: 15, fontWeight: FontWeight.w500),),
            SizedBox(height: height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${price.toString()}', // Dollar symbol with two decimal places
                  style: const TextStyle(
                    color: Colors.black,fontSize: 18,fontWeight: FontWeight.w500,),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart,size:32,color: Colors.black,),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}