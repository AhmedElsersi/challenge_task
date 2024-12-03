import '../../models/order.dart';
import '../../models/order_status.dart';
import '../../../../core/utils/date_utils.dart';

class OrderAnalyticsService {
  double calculateTotalRevenue(List<Order> orders) {
    return orders.fold(0.0, (sum, order) => sum + order.price);
  }

  int calculateTotalReturns(List<Order> orders) {
    return orders.where((order) => order.status == OrderStatus.returned).length;
  }

  Map<DateTime, int> calculateOrdersByDate(List<Order> orders) {
    final Map<DateTime, int> result = {};
    for (var order in orders) {
      final date = DateUtils.normalizeDate(order.registered);
      result[date] = (result[date] ?? 0) + 1;
    }
    return result;
  }

  Map<DateTime, double> calculateRevenueByDate(List<Order> orders) {
    final Map<DateTime, double> result = {};
    for (var order in orders) {
      final date = DateUtils.normalizeDate(order.registered);
      result[date] = (result[date] ?? 0) + order.price;
    }
    return result;
  }

  double calculateAverageOrderValue(List<Order> orders) {
    if (orders.isEmpty) return 0;
    return calculateTotalRevenue(orders) / orders.length;
  }
}