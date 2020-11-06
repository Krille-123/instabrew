import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instadrunkapp/dto/order.dart';
import 'package:instadrunkapp/screens/delivery/widgets/statuses/confirmed.dart';
import 'package:instadrunkapp/screens/delivery/widgets/statuses/delivered.dart';
import 'package:instadrunkapp/screens/delivery/widgets/statuses/delivering.dart';
import 'package:instadrunkapp/screens/delivery/widgets/statuses/initated.dart';

class Delivery extends StatelessWidget {
  final String orderId;
  final String address;

  const Delivery({this.orderId, this.address});

  Widget _buildStatusWidget(orderStatus) {
    var statusWidget;

    switch (orderStatus) {
      case OrderStatus.Initiated:
        statusWidget = Initiated();
        break;

      case OrderStatus.Delivered:
        statusWidget = Delivered();
        break;

      case OrderStatus.Delivering:
        statusWidget = Delivering(address: address);
        break;

      case OrderStatus.Confirmed:
        statusWidget = Confirmed();
        break;
    }

    return statusWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('orders')
              .doc(orderId)
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (!snapshot.hasError && snapshot.hasData) {
              final order = Order.fromJson(snapshot.data.data());
              return _buildStatusWidget(order.status);
            }

            return SizedBox.shrink();
          }),
    );
  }
}
