import 'package:flutter/material.dart';

enum ButtonAction { increment, decrement }

class IncrementButton extends StatelessWidget {
  final ButtonAction action;
  final bool disabled;
  final Function onPressed;

  const IncrementButton({this.action, this.onPressed, this.disabled = false});

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: 10,
        height: 10,
        child: OutlineButton(
          child: Text(action == ButtonAction.decrement ? "-" : "+"),
          borderSide: BorderSide(color: Colors.black54),
          onPressed: disabled ? null : onPressed,
        ));
  }
}
