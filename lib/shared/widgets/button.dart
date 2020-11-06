import 'package:flutter/material.dart';
import 'package:instadrunkapp/constants.dart';

class Button extends StatelessWidget {
  final String label;
  final Function onPressed;

  const Button({this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: OutlineButton(
        child: Text(label),
        onPressed: onPressed,
        borderSide: BorderSide(color: kPrimaryColor),
        textColor: kPrimaryColor,
      ),
    );
  }
}
