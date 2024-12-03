import 'package:flutter/material.dart';

import '../../../../models/order_status.dart';

class OrderStatusBadge extends StatelessWidget {
  final String status;

  const OrderStatusBadge({
    super.key,
    required this.status,
  });

  Color _getStatusColor(BuildContext context) {
    final theme = Theme.of(context);
    switch (status) {
      case OrderStatus.delivered:
        return Colors.green;
      case OrderStatus.ordered:
        return theme.colorScheme.primary;
      case OrderStatus.pending:
        return Colors.orange;
      case OrderStatus.returned:
        return Colors.red;
      default:
        return theme.colorScheme.secondary;
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getStatusColor(context);
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.2),
        ),
      ),
      child: Text(
        status,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}