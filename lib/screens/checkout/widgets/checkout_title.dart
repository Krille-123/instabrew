import 'package:flutter/material.dart';
import 'package:instadrunkapp/constants.dart';

class CheckoutTitle extends StatelessWidget {
  final String text;

  const CheckoutTitle({this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: kDefaultPadding, left: kDefaultPadding),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(text,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
      ),
    );
  }
}
