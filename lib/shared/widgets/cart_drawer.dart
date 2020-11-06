import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instadrunkapp/model/cart.dart';
import 'package:instadrunkapp/screens/checkout/checkout.dart';
import 'package:instadrunkapp/shared/widgets/button.dart';
import 'package:provider/provider.dart';

class CartDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, _) {
      final total = cart.items.isNotEmpty
          ? cart.items
              .map((item) => item.amount * item.product.price)
              .reduce((a, b) => a + b)
              .toStringAsFixed(2)
          : 0;

      return Drawer(
          child: cart.items.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView(
                            shrinkWrap: true,
                            children: cart.items
                                .map((cartItem) => Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(cartItem.product.name),
                                              Text("x ${cartItem.amount}",
                                                  style:
                                                      TextStyle(fontSize: 11))
                                            ],
                                          ),
                                          Text(
                                              "${(cartItem.product.price * cartItem.amount).toStringAsFixed(2)} kr.",
                                              style: TextStyle(fontSize: 14))
                                        ],
                                      ),
                                    ))
                                .toList()),
                        SizedBox(height: 5),
                        Divider(color: Colors.black),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("Total: "), Text("$total kr.")]),
                        SizedBox(height: 8),
                        Align(
                            child: Button(
                                label: "Clear cart", onPressed: cart.clear),
                            alignment: Alignment.center),
                        Align(
                            child: Button(
                                label: "Checkout",
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Checkout()));
                                }),
                            alignment: Alignment.center)
                      ]),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Your cart is empty. Add some brews!",
                            style: TextStyle(fontSize: 18)),
                        Button(
                            onPressed: () => Navigator.pop(context),
                            label: "Close"),
                      ]),
                ));
    });
  }
}
