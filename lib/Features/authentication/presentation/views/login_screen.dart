import 'package:flutter/material.dart';
import 'package:shop_smart/Core/utils/custom_bottom.dart';
import 'package:shop_smart/Core/utils/custom_text_filed.dart';
import 'package:shop_smart/Features/authentication/presentation/views/sign_up_screen.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

   static const String routeName = "LoginScreen";

   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height*0.1,),
                  Align(
                    alignment: Alignment.center,
                    child: Text("Login to Only One",
                      style:  Theme.of(context).textTheme.bodyLarge?.apply(fontSizeFactor: 2),),),
                  SizedBox(height: height*0.1),
                  Text("Email :",
                    style: Theme.of(context).textTheme.bodySmall?.apply(fontSizeFactor: 1.6),),
                  SizedBox(height: height*0.02),
                  CustomTextField(
                    hintText: "Email",
                    type: TextInputType.emailAddress,
                    controller: emailController,
                    prefixIcon: Icons.email,
                  ),
                  SizedBox(height: height*0.06),
                  Text("Password :", style: Theme.of(context).textTheme.bodySmall?.apply(fontSizeFactor: 1.6),),
                  SizedBox(height: height*0.02),
                  CustomTextField(
                      prefixIcon: Icons.lock,
                      suffixIcon: Icons.remove_red_eye,
                      hintText: "Password",
                      type: TextInputType.text,
                      controller: passwordController
                  ),
                  SizedBox(height: height*0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children:
                    [
                      InkWell(
                        onTap: (){},
                        child: Text("ForgotPassword ?",
                          style: Theme.of(context).textTheme.bodySmall?.apply(fontSizeFactor: 1.3),),
                      )
                    ],
                  ),
                  SizedBox(height: height*0.1),
                  CustomButton(
                      text: "LogIn",
                      onPressed: (){},
                  ),
                  SizedBox(height: height*0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don’t have an account ?",
                        style: Theme.of(context).textTheme.bodySmall?.apply(fontSizeFactor: 1.4),),
                      TextButton(
                        style: Theme.of(context).textButtonTheme.style,
                        onPressed: (){
                          Navigator.pushNamed(context, SignUpScreen.routeName);
                        },
                        child: const Text("SIGN UP",style: TextStyle(fontSize: 18),),
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
