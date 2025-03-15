import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.grey,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image(image: const AssetImage("assets/images/empty favourite.png"),
                height: height*0.2, width: width*0.3,fit: BoxFit.cover,),
            ),
            SizedBox(height: height*0.01,),
            const Text("Title", style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),),
            SizedBox(height: height*0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("120 EL", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500),),
                IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart,color: Colors.white,))
              ],
            )
          ],
        ),
      ),
    );
  }
}
