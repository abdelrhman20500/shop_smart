import 'package:flutter/material.dart';
import 'package:shop_smart/Features/authentication/presentation/views/login_screen.dart';
import 'package:shop_smart/Features/authentication/presentation/views/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomeScreen(),
      routes: {
        LoginScreen.routeName:(_)=>LoginScreen(),
        SignUpScreen.routeName:(_)=>SignUpScreen(),
      },
      initialRoute: SignUpScreen.routeName,
    );
  }
}
