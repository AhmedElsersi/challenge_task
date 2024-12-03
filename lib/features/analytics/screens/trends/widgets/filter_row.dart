import 'package:flutter/material.dart';

class FilterRow extends StatelessWidget {
  final String selectedFilter;
  final ValueChanged<String> onFilterChanged;

  const FilterRow({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Orders $selectedFilter',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        DropdownButton<String>(
          value: selectedFilter,
          underline: const SizedBox(),
          items: const [
            DropdownMenuItem(value: 'By Month', child: Text('By Month',style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),)),
            DropdownMenuItem(value: 'By Day', child: Text('By Day',style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),)),
          ],
          onChanged: (value) => onFilterChanged(value!),
        ),
      ],
    );
  }
}