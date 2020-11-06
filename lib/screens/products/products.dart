import 'package:flutter/material.dart';
import 'package:instadrunkapp/screens/products/widgets/product_list.dart';
import 'package:instadrunkapp/shared/widgets/cart_drawer.dart';
import 'package:instadrunkapp/shared/widgets/search.dart';

class Products extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.shopping_cart_outlined),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: CartDrawer(),
      body: Column(children: [Search(), ProductList()]),
    );
  }
}
