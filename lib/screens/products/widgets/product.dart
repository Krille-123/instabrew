import 'package:flutter/material.dart';
import 'package:instadrunkapp/constants.dart';
import 'package:instadrunkapp/dto/product.dart' as dto;
import 'package:instadrunkapp/model/cart.dart';
import 'package:instadrunkapp/screens/products/widgets/increment_button.dart';
import 'package:provider/provider.dart';

class Product extends StatelessWidget {
  final dto.Product product;
  final String formattedPrice;

  Product(this.product) : formattedPrice = product.price.toStringAsFixed(2);

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, _) {
      final amountInCart = cart.items
              .firstWhere((item) => item.product.id == product.id,
                  orElse: () => null)
              ?.amount ??
          0;

      return Card(
        elevation: 2,
        child: Row(children: [
          Container(
            padding: EdgeInsets.all(kDefaultPadding),
            child: Image.network(product.imageUrl, width: 70.0, height: 120.0),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(product.name,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)),
            SizedBox(height: 5),
            Text("$formattedPrice kr."),
            SizedBox(height: 5),
            Text("${product.category} from ${product.origin}"),
            SizedBox(height: 5),
            Row(children: [
              IncrementButton(
                  disabled: amountInCart < 1,
                  action: ButtonAction.decrement,
                  onPressed: () => cart.remove(product)),
              SizedBox(width: 5),
              Text("$amountInCart", style: TextStyle(fontSize: 16)),
              SizedBox(width: 5),
              IncrementButton(
                  action: ButtonAction.increment,
                  onPressed: () => cart.add(product))
            ])
          ])
        ]),
      );
    });
  }
}
