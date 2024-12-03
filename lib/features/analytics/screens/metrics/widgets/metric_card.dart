import 'package:challenge_task/features/analytics/models/metric_model.dart';
import 'package:flutter/material.dart';

class MetricCard extends StatelessWidget {
  final MetricModel metricModel;

  const MetricCard({
    super.key, required this.metricModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            metricModel.icon,
            color: metricModel.color,
            size: 24,
          ),
          const SizedBox(height: 8),
          FittedBox(
            child: Text(
              metricModel.value??"-",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            metricModel.title??"-",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}