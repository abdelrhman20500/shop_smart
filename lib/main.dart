import 'package:flutter/material.dart';
import 'package:shop_smart/Features/authentication/presentation/views/login_screen.dart';
import 'package:shop_smart/Features/authentication/presentation/views/sign_up_screen.dart';
import 'package:shop_smart/Features/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Test(),
      routes: {
        LoginScreen.routeName:(_)=>LoginScreen(),
        SignUpScreen.routeName:(_)=>SignUpScreen(),
        HomeScreen.routeName:(_)=>const HomeScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
