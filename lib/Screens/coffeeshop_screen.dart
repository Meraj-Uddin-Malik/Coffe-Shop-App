import 'package:coffee_shop/Screens/cart_screen.dart';
import 'package:coffee_shop/Screens/shop_screen.dart';
import 'package:coffee_shop/components/bottom_nav_bar.dart';
import 'package:coffee_shop/Screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CoffeeShopScreen extends StatefulWidget {
  const CoffeeShopScreen({super.key});

  @override
  State<CoffeeShopScreen> createState() => _CoffeeShopScreenState();
}

class _CoffeeShopScreenState extends State<CoffeeShopScreen> {
  // bottom bar
  int _selectedIndex = 0;
  void navigationBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [ShopScreen(), CartScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigationBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
