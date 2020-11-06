import 'dart:async';

import 'package:flutter/material.dart';
import 'package:instadrunkapp/screens/delivery/widgets/delivery_progress_indicator.dart';
import 'package:instadrunkapp/screens/delivery/widgets/status_title.dart';

class Initiated extends StatefulWidget {
  @override
  _InitiatedState createState() => _InitiatedState();
}

class _InitiatedState extends State<Initiated> {
  int dotAmount;
  Timer dotTimer;

  @override
  void initState() {
    dotAmount = 1;

    dotTimer = Timer.periodic(Duration(milliseconds: 500), (_) {
      setState(() {
        if (dotAmount < 3)
          dotAmount++;
        else
          dotAmount = 1;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    dotTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      StatusTitle(text: "Confirming your order"),
      StatusTitle(text: "." * dotAmount),
      DeliveryProgressIndicator(progress: 0.25)
    ]);
  }
}
