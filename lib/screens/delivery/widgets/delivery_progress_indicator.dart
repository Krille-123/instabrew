import 'package:flutter/material.dart';
import 'package:instadrunkapp/constants.dart';

class DeliveryProgressIndicator extends StatelessWidget {
  final double progress;

  const DeliveryProgressIndicator({this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(kDefaultPadding * 2),
        child: LinearProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
            value: progress),
      ),
    );
  }
}
