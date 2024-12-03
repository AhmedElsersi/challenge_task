import 'package:flutter/material.dart';
import '../../../../models/order_status.dart';

class OrderStatusFilter extends StatelessWidget {
  final String? selectedStatus;
  final ValueChanged<String?> onStatusChanged;

  const OrderStatusFilter({
    super.key,
    required this.selectedStatus,
    required this.onStatusChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FilterChip(
            label: const Text('All'),
            selected: selectedStatus == null,
            onSelected: (_) => onStatusChanged(null),
            showCheckmark: false,
          ),
          const SizedBox(width: 8),
          FilterChip(
            label: const Text('Pending'),
            selected: selectedStatus == OrderStatus.pending,
            onSelected: (_) => onStatusChanged(OrderStatus.pending),
            showCheckmark: false,
            backgroundColor: selectedStatus == OrderStatus.pending
                ? Colors.orange.withOpacity(0.1)
                : null,
            selectedColor: Colors.orange.withOpacity(0.2),
            labelStyle: TextStyle(
              color: selectedStatus == OrderStatus.pending
                  ? Colors.orange
                  : theme.textTheme.bodyMedium?.color,
            ),
          ),
          const SizedBox(width: 8),
          FilterChip(
            label: const Text('Ordered'),
            selected: selectedStatus == OrderStatus.ordered,
            onSelected: (_) => onStatusChanged(OrderStatus.ordered),
            showCheckmark: false,
            backgroundColor: selectedStatus == OrderStatus.ordered
                ? theme.colorScheme.primary.withOpacity(0.1)
                : null,
            selectedColor: theme.colorScheme.primary.withOpacity(0.2),
            labelStyle: TextStyle(
              color: selectedStatus == OrderStatus.ordered
                  ? theme.colorScheme.primary
                  : theme.textTheme.bodyMedium?.color,
            ),
          ),
          const SizedBox(width: 8),
          FilterChip(
            label: const Text('Delivered'),
            selected: selectedStatus == OrderStatus.delivered,
            onSelected: (_) => onStatusChanged(OrderStatus.delivered),
            showCheckmark: false,
            backgroundColor: selectedStatus == OrderStatus.delivered
                ? Colors.green.withOpacity(0.1)
                : null,
            selectedColor: Colors.green.withOpacity(0.2),
            labelStyle: TextStyle(
              color: selectedStatus == OrderStatus.delivered
                  ? Colors.green
                  : theme.textTheme.bodyMedium?.color,
            ),
          ),
          const SizedBox(width: 8),
          FilterChip(
            label: const Text('Returned'),
            selected: selectedStatus == OrderStatus.returned,
            onSelected: (_) => onStatusChanged(OrderStatus.returned),
            showCheckmark: false,
            backgroundColor: selectedStatus == OrderStatus.returned
                ? Colors.red.withOpacity(0.1)
                : null,
            selectedColor: Colors.red.withOpacity(0.2),
            labelStyle: TextStyle(
              color: selectedStatus == OrderStatus.returned
                  ? Colors.red
                  : theme.textTheme.bodyMedium?.color,
            ),
          ),
        ],
      ),
    );
  }
}