import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/order.dart';
import 'services/order_analytics_service.dart';
import 'services/order_data_service.dart';

class OrderProvider with ChangeNotifier {
  final OrderAnalyticsService _analyticsService;
  final OrderDataService _dataService;

  List<Order> _orders = [];
  bool _isLoading = true;

  OrderProvider({
    OrderAnalyticsService? analyticsService,
    OrderDataService? dataService,
  }) : _analyticsService = analyticsService ?? OrderAnalyticsService(),
        _dataService = dataService ?? OrderDataService() {
    loadOrders();
  }

  List<Order> get orders => List.unmodifiable(_orders);
  bool get isLoading => _isLoading;

  Future<void> loadOrders() async {
    try {
      _orders = await _dataService.loadOrders();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      debugPrint('Error loading orders: $e');
      _isLoading = false;
      notifyListeners();
    }
  }

  double get totalRevenue => _analyticsService.calculateTotalRevenue(_orders);
  int get totalOrders => _orders.length;
  int get totalReturns => _analyticsService.calculateTotalReturns(_orders);
  Map<DateTime, int> get ordersByDate => _analyticsService.calculateOrdersByDate(_orders);
  Map<DateTime, double> get revenueByDate => _analyticsService.calculateRevenueByDate(_orders);
  double get averageOrderValue => _analyticsService.calculateAverageOrderValue(_orders);
}