import 'package:flutter/material.dart';

import 'app_color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});
  final String text;
  final void Function()? onPressed;
  final double width= double.infinity;
  final double height= 64;
  // final Color? color;
  final double fontSize = 20;
  final Color textColor = Colors.white;
  final bool isUppercase =true;
  final Color background = Colors.blue;
  final FontWeight fontWeight = FontWeight.bold;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(offset: const Offset(0, 3), blurRadius: 6 , color: AppColors.primaryColor),
          ],
          borderRadius: BorderRadius.circular(24),
          color: background,
        ),
        child: Center(
          child: Text(
            isUppercase ?text.toUpperCase() : text,
            style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: fontWeight
            ),

          ),
        ),
      ),
    );
  }
}
