import 'package:e_commerce_app/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier{
  // List of products for sale : 
  final List<Product> _shop = [
    Product(name: "Premium Glasses", price: 12.99, description: "Very good product , check it out", imagePath: 'assets/glasses.jpeg'),
    Product(name: "Favourite Hoodie", price: 23.99, description: "The best product", imagePath: 'assets/hoodies.jpeg'),
    Product(name: "Casual T-shirt ", price: 34.99, description: "Good product", imagePath: 'assets/shirt.jpeg'),
    Product(name: "Cool Shoes", price: 45.99, description: "Very GoodLooking Product", imagePath: 'assets/shoe.png'),

  ];
  // Users Cart : 
  

  List<Product> _cart = [];
  // get product list : 
  List<Product> get shop => _shop;
  // get user cart list : 
  List <Product> get cart => _cart;
  // add item to cart : 
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }
  // remove item from cart : 
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}