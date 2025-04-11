import 'package:e_commerce_app/components/my_drawer.dart';
import 'package:e_commerce_app/components/my_product_tile.dart';
import 'package:e_commerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {

    // access products in shop : 
    final products = context.watch<Shop>().shop;
    return Scaffold(
      backgroundColor : Theme.of(context).colorScheme.primary,
      appBar : AppBar(
        title : Text("Shop Page"),
        actions : [
          // Cart page : 
          IconButton(onPressed: () => Navigator.pushNamed(context , '/cart_page'),icon : Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      drawer: MyDrawer(),
      body : ListView(
        children : [
          const SizedBox(height : 25),
          // Text/ Logo : 
          Center(child: Text("Pick from a selected list of premium Products" ,
            style : TextStyle(
              color : Theme.of(context).colorScheme.inversePrimary,
            )),  
          ),

          // Shop Subtitle : 

          // All Products : 
          SizedBox(
          height : 550,
          child: ListView.builder(
            itemCount : products.length,
            scrollDirection: Axis.horizontal,
            padding : const EdgeInsets.all(15),
            itemBuilder: (context , index) {
              // get individual product from the shop : 
              final product = products[index];
              // return as a product tile in UI : 
              return MyProductTile(product: product);
          
          }),
        ),
        ]
        
      )
    );
  }
}