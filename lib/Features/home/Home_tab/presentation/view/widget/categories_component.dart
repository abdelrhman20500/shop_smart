import 'package:flutter/material.dart';


class CategoriesComponent extends StatelessWidget {
  const CategoriesComponent({super.key});

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return SizedBox(
      height: height*0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.grey
              ),
              child: Column(
                children: [
                  const Text("Title", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),),
                  SizedBox(height: height*0.01,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(image: const AssetImage("assets/images/empty favourite.png"),
                      height: height*0.07, width: width*0.2,fit: BoxFit.cover,),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
