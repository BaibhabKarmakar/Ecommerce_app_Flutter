import 'package:e_commerce_app/components/my_button.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor : Theme.of(context).colorScheme.surface,
      body : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children : [
            // logo
            Icon(Icons.shopping_bag , size : 72 , color : Theme.of(context).colorScheme.inversePrimary ),
            const SizedBox(height : 25),
            // title
            Text("Minimal Shop" , style : TextStyle(fontWeight : FontWeight.bold , fontSize : 24)),
            const SizedBox(height : 10),
        
            // sub-title
            Text("Premium Quality Products" , style : TextStyle(color : Theme.of(context).colorScheme.inversePrimary , fontSize : 16)),
            const SizedBox(height : 40),
            // button
            MyButton(
              onTap: () => Navigator.pushNamed(context, '/shop_page'), 
              child: Icon(
                Icons.arrow_forward , color : Theme.of(context).colorScheme.inversePrimary
              )
            )
          ]
        ),
      )
    );
  }
}