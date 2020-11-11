import 'package:flutter/material.dart';
import 'package:instadrunkapp/dto/order.dart';
import 'package:uuid/uuid.dart';
import 'package:instadrunkapp/constants.dart';
import 'package:instadrunkapp/screens/checkout/widgets/location_picker.dart';
import 'package:instadrunkapp/screens/checkout/widgets/checkout_title.dart';
import 'package:instadrunkapp/screens/delivery/delivery.dart';
import 'package:instadrunkapp/shared/widgets/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stripe_sdk/stripe_sdk_ui.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String address;

  void _createOrder() async {
    final orderId = Uuid().v4();

    await FirebaseFirestore.instance
        .collection("orders")
        .doc(orderId)
        .set({"address": address, "status": OrderStatus.Initiated.toString()});

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Delivery(address: address, orderId: orderId)));
  }

  @override
  void initState() {
    address = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final card = StripeCard();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          CheckoutTitle(text: "Payment"),
          CardForm(card: card, formKey: formKey),
          CheckoutTitle(text: "Delivery address"),
          LocationPicker(onChanged: (value) {
            setState(() {
              address = value;
            });
          }),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
            child: Button(label: "Order", onPressed: _createOrder),
          )
        ]),
      ),
    );
  }
}

// testing gitpod integration
