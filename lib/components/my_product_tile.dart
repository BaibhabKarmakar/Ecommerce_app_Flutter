import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;

  const MyProductTile({
    super.key, 
    required this.product
  });

  // Add to cart button pressed : 
  void addToCart(BuildContext context) {
    // show a dialogue box to confirm the action :
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content : Text("Add this item to your cart ? "),
        actions: [
          // cancel button
          MaterialButton(
            onPressed : () => Navigator.pop(context),
            child : Text("Cancel"),
          ),

          // yes button
          MaterialButton(
            onPressed : () {
              // pop the dialog box : 
              Navigator.pop(context);
              // add to cart : 
              context.read<Shop>().addToCart(product);
            },
            child : Text("Add"),
          ),

        ],
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration : BoxDecoration(
        color : Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      margin : const EdgeInsets.all(10),
      padding : const EdgeInsets.all(25),
      width : 300,
      child : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children : [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children : [
              // images of the product : 
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color : Theme.of(context).colorScheme.primary,
              ),
              width : double.infinity,
              child: Image.asset(product.imagePath , fit : BoxFit.cover),
            ),
          ),

          const SizedBox(height : 20),
          // Product name : 
          Text(product.name , style : TextStyle(fontWeight : FontWeight.bold , fontSize : 20)),
          const SizedBox(height : 10),
          // Product Description : 
          Text(product.description , style : TextStyle(color : Theme.of(context).colorScheme.inversePrimary)),
            ]
          ),
          // Product price : 
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('₹${product.price.toStringAsFixed(2)}'),


              // Add to cart button : 
              Container(
                decoration : BoxDecoration(
                  color : Theme.of(context).colorScheme.primary,
                  borderRadius : BorderRadius.circular(12),
                ),
                child: IconButton(onPressed: () => addToCart(context), icon: Icon(Icons.add))),
            ],
          ),
          // Button to add to cart : 

        ],
      )
    );
  }
}
