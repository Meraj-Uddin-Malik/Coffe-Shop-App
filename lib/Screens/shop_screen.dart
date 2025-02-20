import 'package:flutter/material.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Text(
                "How Would You Like Your Coffee?",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 25,),
              
              Expanded(child: ListView.builder(itemBuilder: (context, index){

              }))
            ],
          ),
        ),
      ),
    );
  }
}
