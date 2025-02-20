import 'package:coffee_shop/Components/coffee_tile.dart';
import 'package:coffee_shop/Model/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Model/coffee.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {

  void addToCart(Coffee coffee){
    Provider.of<CoffeeShop>(context, listen: false).addItemToCart(coffee);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Item Added"),
        content: const Text("Successfully Added To Your Cart."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade300,
      body: Consumer<CoffeeShop>(
          builder: (context, value, child) => SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 60.0,
                        backgroundImage: AssetImage("images/coffeeShop.png"),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Welcome To CoffeeShop",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        "How Would You Like Your Coffee?",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Expanded(
                          child: ListView.builder(
                            itemCount: value.coffeshop.length,
                              itemBuilder: (context, index) {
                                // get individual coffee
                                Coffee eachCoffee = value.coffeshop[index];

                                // return the tile for coffee
                                return CoffeeTile(coffee: eachCoffee,
                                icon: Icon(Icons.add),
                                onPressed: () => addToCart(eachCoffee),);

                              }))
                    ],
                  ),
                ),
              )
      ),
    );
  }
}
