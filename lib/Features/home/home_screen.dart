import 'package:flutter/material.dart';
import 'package:shop_smart/Features/home/Cart_tab/presentation/view/cart_tab.dart';
import 'package:shop_smart/Features/home/Fav_tab/presentation/view/fav_tab.dart';
import 'package:shop_smart/Features/home/Home_tab/presentation/view/home_tab.dart';
import 'package:shop_smart/Features/home/Settings_tab/presentation/view/settings_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName ="HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex=0;

  final List<Widget> tabs=[
    const HomeTab(),
    const FavTab(),
    const CartTab(),
    const SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: Theme(
        data: ThemeData(canvasColor: Colors.white70),
        child: BottomNavigationBar(
          selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            currentIndex: currentIndex,
            onTap: (index){
              currentIndex =index;
              setState(() {});
            },
            items:const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home",),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
            ] ),
      ),
    );
  }
}
