import 'package:e_commerce_app/components/my_button.dart';
import 'package:e_commerce_app/models/product.dart';
import 'package:e_commerce_app/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  // remove item from cart : 
  void removeItemFromCart(BuildContext context , Product product) {
    // show a dialogue box to confirm the action :
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content : Text("Remove this item from your cart ? "),
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
              context.read<Shop>().removeFromCart(product);
            },
            child : Text("Yes"),
          ),

        ],
      )
    );
  }

  // user pressed pay button : 
  void payButtonPressed(BuildContext context) {
    showDialog(
      context : context,
      builder : (context) => AlertDialog(
        content : Text("User wants to pay! \nConnect this app to the payment backend,you Idiot!!!" , style: TextStyle(fontSize : 17),),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // start getting access to the cart : 
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      backgroundColor : Theme.of(context).colorScheme.secondary,
      appBar : AppBar(
        title : Text("Cart Page"),
      ),

      body : Column(
        children: [
          // cart list : 
          Expanded(
            child: cart.isEmpty ? Center(child: Text("Please add some premium products into the cart!")) : ListView.builder(
              itemCount : cart.length,
              itemBuilder:(context, index) {
                // get individual item in the cart : 
                final item = cart[index];
                // return as a list tile : 
                return ListTile(
                  title : Text(item.name),
                  subtitle : Text(item.price.toStringAsFixed(2)),
                  trailing : IconButton(
                    icon : Icon(Icons.remove), 
                    onPressed: () => removeItemFromCart(context , item),
                  ),
                );
              },
            ),
          ),
          // pay button : 
          Padding(
            padding: const EdgeInsets.only(bottom : 30.0),
            child: MyButton(onTap: () => payButtonPressed(context) , child: Text("PAY NOW!")),
          )
        ],
      )
    );
  }
  
}