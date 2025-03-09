import 'package:flutter/material.dart';
import 'package:shop_smart/Core/utils/custom_bottom.dart';
import 'package:shop_smart/Core/utils/custom_text_filed.dart';
import 'package:shop_smart/Features/authentication/presentation/views/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  static const String routeName = "SignUpScreen";
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xffefede9),
      body: Center(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 25.0, right: 25, top: 40, bottom: 15),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name :", style: Theme.of(context).textTheme.bodySmall?.apply(fontSizeFactor: 1.6),),
                  SizedBox(height: height * 0.02),
                  CustomTextField(
                    hintText: "name",
                    type: TextInputType.text,
                    controller: nameController,
                    prefixIcon: Icons.supervised_user_circle_outlined,
                  ),
                  SizedBox(height: height * 0.05,),
                  Text("Email :", style: Theme.of(context).textTheme.bodySmall?.apply(fontSizeFactor: 1.6),),
                  SizedBox(height: height * 0.02,),
                  CustomTextField(
                    hintText: "email",
                    type: TextInputType.emailAddress,
                    controller: emailController,
                    prefixIcon: Icons.email,
                  ),
                  SizedBox(height: height * 0.05,),
                  Text("Password :", style: Theme.of(context).textTheme.bodySmall?.apply(fontSizeFactor: 1.6),),
                  SizedBox(height: height * 0.02,),
                  CustomTextField(
                    hintText: "password",
                    type: TextInputType.text,
                    controller: passwordController,
                    prefixIcon: Icons.lock,
                    suffixIcon: Icons.remove_red_eye,
                  ),
                  SizedBox(height: height * 0.05,),
                  Text("Phone :", style: Theme.of(context).textTheme.bodySmall?.apply(fontSizeFactor: 1.6),),
                  SizedBox(height: height * 0.02,),
                  CustomTextField(
                    hintText: "phone",
                    type: TextInputType.phone,
                    controller: phoneController,
                    prefixIcon: Icons.phone,
                  ),
                  SizedBox(height: height * 0.05,),
                  CustomButton(text: "signUp", onPressed: () {}),
                  SizedBox(height: height * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?', style: Theme.of(context).textTheme.bodySmall?.apply(fontSizeFactor: 1.3),),
                      TextButton(
                        style: Theme.of(context).textButtonTheme.style,
                        onPressed: (){
                          Navigator.pushNamed(context, LoginScreen.routeName);
                        },
                        child: const Text("Login", style: TextStyle(fontSize: 18),),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
