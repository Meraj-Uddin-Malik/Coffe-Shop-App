import 'package:coffee_shop/Model/coffee.dart';

class CoffeeShop {
  // coffee for sale list
  final List<Coffee> _shop = [
    // black coffee
    Coffee(name: 'Long Black', price: '3.6', imagePath: 'images/coffee.png'),
    // late coffee
    Coffee(name: 'Late', price: '8.6', imagePath: 'images/coffee-cup.png'),
    // espresso coffee
    Coffee(name: 'Espresso', price: '9.6', imagePath: 'images/cup.png'),
    // iced coffee
    Coffee(
        name: 'Iced Coffee', price: '7.6', imagePath: 'images/iced-coffee.png'),
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
  }

  //remove cart
  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
  }
}
