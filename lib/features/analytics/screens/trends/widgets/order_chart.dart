import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../models/order_data.dart';
import '../../../../../core/utils/date_formatter.dart';

class OrderChart extends StatelessWidget {
  final Map<DateTime, int> orders;
  final String selectedFilter;

  const OrderChart({
    super.key,
    required this.orders,
    required this.selectedFilter,
  });

  List<OrderData> _processData() {
    final groupedOrders = <DateTime, int>{};
    for (final entry in orders.entries) {
      final key = selectedFilter == 'By Day'
          ? DateTime(entry.key.year, entry.key.month, entry.key.day)
          : DateTime(entry.key.year, entry.key.month);
      groupedOrders[key] = (groupedOrders[key] ?? 0) + entry.value;
    }

    return groupedOrders.entries
        .map((e) => OrderData(e.key, e.value))
        .toList()
      ..sort((a, b) => a.date.compareTo(b.date));
  }

  @override
  Widget build(BuildContext context) {
    final chartData = _processData();

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SfCartesianChart(
          plotAreaBorderWidth: 0,
          primaryXAxis: DateTimeAxis(
            majorGridLines: const MajorGridLines(width: 0),
            intervalType: selectedFilter == 'By Day'
                ? DateTimeIntervalType.days
                : DateTimeIntervalType.months,
            interval: selectedFilter == 'By Day' ? 7 : 1,
            dateFormat: selectedFilter == 'By Day'
                ? DateFormatter.dayFormat
                : DateFormatter.monthFormat,
            labelStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          primaryYAxis: const NumericAxis(
            majorGridLines: MajorGridLines(
              width: 1,
              color: Colors.grey,
              dashArray: [5, 5],
            ),
            labelStyle: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          series: [
            SplineAreaSeries<OrderData, DateTime>(
              dataSource: chartData,
              xValueMapper: (OrderData data, _) => data.date,
              yValueMapper: (OrderData data, _) => data.value,
              color: Theme.of(context).colorScheme.primary,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.primary.withOpacity(0.3),
                  Theme.of(context).colorScheme.primary.withOpacity(0.1),
                ],
              ),
            ),
            SplineSeries<OrderData, DateTime>(
              dataSource: chartData,
              xValueMapper: (OrderData data, _) => data.date,
              yValueMapper: (OrderData data, _) => data.value,
              color: Theme.of(context).colorScheme.primary,
              width: 3,
              markerSettings: MarkerSettings(
                isVisible: true,
                color: Colors.white,
                borderColor: Theme.of(context).colorScheme.primary,
                borderWidth: 2,
              ),
            ),
          ],
          tooltipBehavior: TooltipBehavior(
            enable: true,
            format: 'Orders: point.y',
          ),
          zoomPanBehavior: ZoomPanBehavior(
            enablePinching: true,
            enablePanning: true,
            zoomMode: ZoomMode.x,
          ),
        ),
      ),
    );
  }
}