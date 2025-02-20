import 'package:coffee_shop/Components/coffee_tile.dart';
import 'package:coffee_shop/Model/coffee.dart';
import 'package:coffee_shop/Model/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  void removeFromCart(Coffee coffee) {
    Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);

    // Success dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Item Removed"),
        content: const Text("This coffee has been removed from your cart."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
  void payNow(){

  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: (context, value, child) => Scaffold(
              backgroundColor: Colors.brown.shade300,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      // heading cart screen
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Your Cart Items",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      //list cart items
                      Expanded(
                        child: ListView.builder(
                        itemCount: value.usercart.length,
                        itemBuilder: (context, index) {
                          Coffee eachCoffee = value.usercart[index];
                          return CoffeeTile(
                              coffee: eachCoffee,
                              onPressed: () => removeFromCart(eachCoffee),
                              icon: Icon(Icons.delete));
                        },
                      ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Container(
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Box 1: Total Items
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.brown.shade300,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "Total Items",
                                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
                                    ),
                                    SizedBox(height: 5),
                                    Text("${value.totalItems}",
                                        style: TextStyle(fontSize: 12, color: Colors.white)),
                                  ],
                                ),
                              ),

                              // Box 2: Total Bill
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Colors.brown.shade300,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "Total Bill",
                                      style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500, color: Colors.white),
                                    ),
                                    SizedBox(height: 5),
                                    Text("\$${value.totalPrice.toStringAsFixed(2)}",
                                        style: TextStyle(fontSize: 12,color: Colors.white)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                      ),
                      GestureDetector(
                        onTap: payNow,
                        child: Container(
                          padding: EdgeInsets.all(25),
                          width: double.infinity,
                          decoration: BoxDecoration(color: Colors.brown,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Text("Pay Now",
                            style: TextStyle(color: Colors.white),),
                          ),

                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
