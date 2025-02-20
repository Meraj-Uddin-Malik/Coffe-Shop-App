import 'package:flutter/material.dart';

import '../Model/coffee.dart';

class CoffeeTile extends StatelessWidget {
  final Coffee coffee;
  void Function()? onPressed;
  final Widget icon;

  CoffeeTile(
      {super.key,
      required this.coffee,
      required this.onPressed,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.brown[200], borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListTile(
        title: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Name : ",
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.brown.shade500,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: coffee.name,
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.brown.shade500,
                  fontWeight: FontWeight.bold)),
        ])),
        subtitle: RichText(
            text: TextSpan(children: [
          TextSpan(
              text: "Price : ",
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.brown.shade500,
                  fontWeight: FontWeight.bold)),
          TextSpan(
              text: coffee.price,
              style: TextStyle(
                  fontSize: 13,
                  color: Colors.brown.shade500,
                  fontWeight: FontWeight.bold)),
        ])),
        leading: Image.asset(coffee.imagePath),
        trailing: IconButton(
          onPressed: onPressed,
          icon: icon,
          color: Colors.brown.shade500,
        ),
      ),
    );
  }
}
