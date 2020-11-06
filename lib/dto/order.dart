class Order {
  final OrderStatus status;
  final String address;
  final String orderId;

  Order(this.status, this.address, this.orderId);

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
        OrderStatus.values
            .firstWhere((value) => value.toString() == json["status"]),
        json["address"],
        json["order_id"]);
  }
}

enum OrderStatus { Initiated, Confirmed, Delivering, Delivered }
