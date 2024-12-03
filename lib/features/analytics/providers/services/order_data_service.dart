import 'dart:convert';
import 'package:flutter/services.dart';

import '../../models/order.dart';

class OrderDataService {
  Future<List<Order>> loadOrders() async {
    final String response = await rootBundle.loadString('assets/orders.json');
    final data = await json.decode(response);
    return (data as List).map((order) => Order.fromJson(order)).toList();
  }

  Future<void> saveOrders(List<Order> orders) async {
    // Implement persistence logic here when needed
    // This could save to local storage, a database, or make an API call
  }
}