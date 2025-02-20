import 'package:coffee_shop/Model/coffee.dart';
import 'package:flutter/cupertino.dart';

class CoffeeShop extends ChangeNotifier{
  // coffee for sale list
  final List<Coffee> _shop = [
    // black coffee
    Coffee(name: 'Long Black', price: '300.0', imagePath: 'images/coffee.png'),
    // late coffee
    Coffee(name: 'Late', price: '800.0', imagePath: 'images/coffee-cup.png'),
    // espresso coffee
    Coffee(name: 'Espresso', price: '780.0', imagePath: 'images/cup.png'),
    // iced coffee
    Coffee(
        name: 'Iced Coffee', price: '450.0', imagePath: 'images/iced-coffee.png'),
  ];

  // usr cart
  List<Coffee> _userCart = [];

//get coffe list
  List<Coffee> get coffeshop => _shop;

//get user cart
  List<Coffee> get usercart => _userCart;

  //get item to cart
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  //remove cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }

  // Calculate total price
  double get totalPrice {
    return usercart.fold(0, (sum, coffee) => sum + double.parse(coffee.price));
  }

// Get total items count
  int get totalItems => usercart.length;

}
