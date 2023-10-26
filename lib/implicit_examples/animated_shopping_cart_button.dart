import 'package:flutter/material.dart';

class ShoppingCartButton extends StatefulWidget {
  const ShoppingCartButton({super.key});

  @override
  State<ShoppingCartButton> createState() => _ShoppingCartButtonState();
}

class _ShoppingCartButtonState extends State<ShoppingCartButton> {
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isExpand = !isExpand;
            });
          },
          child: AnimatedContainer(
            
            width: isExpand ? 200.0 : 80.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: isExpand ? Colors.lightBlue : Colors.blue,
              borderRadius: BorderRadius.circular(isExpand ? 30.0:10.0),
            ),
            duration: const Duration(milliseconds: 500),
            curve: Curves.linear,
            padding: isExpand ? EdgeInsets.symmetric(horizontal: 10) : EdgeInsets.zero,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Icon(
                isExpand ? Icons.check :  Icons.shopping_cart,
                  color: Colors.white,
                ),
                if(isExpand) Expanded(child: Text("Cart shooping", style: TextStyle(color: Colors.white),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
