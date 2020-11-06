import 'package:flutter/material.dart';
import 'package:instadrunkapp/screens/delivery/widgets/delivery_progress_indicator.dart';
import 'package:instadrunkapp/screens/delivery/widgets/status_title.dart';

class Confirmed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      StatusTitle(text: "Order confirmed"),
      Text("We are gathering your beer! Hold tight!"),
      DeliveryProgressIndicator(progress: 0.5)
    ]);
  }
}
