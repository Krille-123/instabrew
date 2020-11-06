import 'package:flutter/material.dart';
import 'package:instadrunkapp/model/cart.dart';
import 'package:instadrunkapp/screens/delivery/widgets/delivery_progress_indicator.dart';
import 'package:instadrunkapp/screens/delivery/widgets/status_title.dart';
import 'package:instadrunkapp/shared/widgets/button.dart';
import 'package:provider/provider.dart';

class Delivered extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(builder: (context, cart, _) {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        StatusTitle(text: "Delivered"),
        Button(
            label: "Back to menu",
            onPressed: () {
              cart.clear();
              Navigator.popUntil(context, (route) => route.isFirst);
            }),
        DeliveryProgressIndicator(progress: 1),
      ]);
    });
  }
}
