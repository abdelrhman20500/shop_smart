import 'package:flutter/material.dart';
import '../../../../../Core/utils/app_color.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: height*0.05,),
          Container(
            height: height*0.1,
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(12),
              color: Colors.brown.withOpacity(0.8)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      boxShadow:
                      [
                        BoxShadow(offset: const Offset(3,3), blurRadius: 6, color: AppColors.shadowSearchHomeColor),
                      ],
                      shape: BoxShape.circle,
                    ),
                    child: const CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage("https://student.valuxapps.com/storage/assets/defaults/user.jpg"),
                    ),
                  ),
                  SizedBox(width: width*0.06),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Adam", style: Theme.of(context).textTheme.bodySmall?.apply(fontSizeFactor: 1.3),),
                      SizedBox(height: height*0.01),
                      Text("adam123@gmail.com",
                        style: Theme.of(context).textTheme.titleSmall?.apply(fontSizeFactor: 1.2),
                      ),
                    ],
                  ),
                  const Spacer(flex: 1,),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios_rounded),color: Colors.black,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
