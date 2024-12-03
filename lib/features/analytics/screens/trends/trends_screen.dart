import '../../../../core/utils/exports.dart';

class TrendsScreen extends StatefulWidget {
  const TrendsScreen({super.key});

  @override
  State<TrendsScreen> createState() => _TrendsScreenState();
}

class _TrendsScreenState extends State<TrendsScreen> {
  String _selectedFilter = 'By Month';

  void _onFilterChanged(String value) {
    setState(() {
      _selectedFilter = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (context, orderProvider, child) {
        if (orderProvider.isLoading) {
          return const LoadingIndicator();
        }
        if (orderProvider.orders.isEmpty) {
          return const ErrorMessage(
            message: 'No orders found',
            icon: Icons.inbox_outlined,
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Order Trends'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: orderProvider.ordersByDate.isEmpty
                ? const Center(
              child: Text(
                'No data available',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
                : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'you can zoom in and out to see the trends clearly',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF1976D2),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 6),

                FilterRow(
                  selectedFilter: _selectedFilter,
                  onFilterChanged: _onFilterChanged,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: OrderChart(
                    orders: orderProvider.ordersByDate,
                    selectedFilter: _selectedFilter,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}