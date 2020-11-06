import 'package:flutter/material.dart';
import 'package:instadrunkapp/screens/delivery/widgets/delivery_progress_indicator.dart';
import 'package:instadrunkapp/screens/delivery/widgets/status_title.dart';

class Delivering extends StatelessWidget {
  final String address;

  const Delivering({this.address});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      StatusTitle(text: "Delivering"),
      Text("Your beer is on it's way to $address!"),
      DeliveryProgressIndicator(progress: 0.75)
    ]);
  }
}
