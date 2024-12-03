import '../../../../core/utils/exports.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  String? _selectedStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: Consumer<OrderProvider>(
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

          final filteredOrders = _selectedStatus == null
              ? orderProvider.orders
              : orderProvider.orders
              .where((order) => order.status == _selectedStatus)
              .toList();

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: OrderStatusFilter(
                  selectedStatus: _selectedStatus,
                  onStatusChanged: (status) {
                    setState(() {
                      _selectedStatus = status;
                    });
                  },
                ),
              ),
              Expanded(
                child: filteredOrders.isEmpty
                    ? const ErrorMessage(
                  message: 'No orders match the selected filter',
                  icon: Icons.filter_list_off,
                )
                    : OrderList(orders: filteredOrders),
              ),
            ],
          );
        },
      ),
    );
  }
}