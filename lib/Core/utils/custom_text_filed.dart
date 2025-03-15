import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.type,
    this.prefixIcon,
    this.suffixIcon, required this.controller, this.validator,
  });

  final String hintText;
  final TextInputType type;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62, // Increased height
      width: double.infinity,
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20), // Adjust padding for increased height
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          hintText: hintText,
          labelStyle: const TextStyle(color:Colors.grey ,fontSize: 22, fontWeight: FontWeight.w500),
          prefixIcon: Icon(prefixIcon, size: 28, color: Colors.grey,),
          suffixIcon: Icon(suffixIcon, size: 28,color: Colors.grey,),
        ),
        keyboardType: type,
      ),
    );
  }
}
