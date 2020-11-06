import 'package:flutter/material.dart';

class StatusTitle extends StatelessWidget {
  final String text;

  const StatusTitle({this.text = ""});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700));
  }
}
