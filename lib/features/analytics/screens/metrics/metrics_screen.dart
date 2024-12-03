import 'package:intl/intl.dart';
import '../../../../core/utils/exports.dart';

class MetricsScreen extends StatefulWidget {
  const MetricsScreen({super.key});

  @override
  State<MetricsScreen> createState() => _MetricsScreenState();
}

class _MetricsScreenState extends State<MetricsScreen> {

  List<MetricModel> metrics(OrderProvider orderProvider) => [
      MetricModel(
        title: 'Total Orders',
        value: orderProvider.totalOrders.toString(),
        icon: Icons.shopping_bag,
        color: Colors.blue,
      ),
      MetricModel(
        title: 'Average Order',
        value: currencyFormat.format(orderProvider.averageOrderValue),
        icon: Icons.attach_money,
        color: Colors.green,
      ),
      MetricModel(
        title: 'Returns',
        value: orderProvider.totalReturns.toString(),
        icon: Icons.assignment_return,
        color: Colors.orange,
      ),
      MetricModel(
        title: 'Total Revenue',
        value: currencyFormat.format(orderProvider.totalRevenue),
        icon: Icons.account_balance_wallet,
        color: Colors.purple,
      ),

  ];
  final currencyFormat = NumberFormat.currency(symbol: '\$');

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
        List<Order> _getLatestOrders() {
          final sortedOrders = List<Order>.from(orderProvider.orders)
            ..sort((a, b) => b.registered.compareTo(a.registered));
          return sortedOrders.take(5).toList();
        }
        return SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Order Insights',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 24),
                LayoutBuilder(
                  builder: (context, constraints) {
                    // Calculate the number of columns dynamically based on the screen width
                    final screenWidth = constraints.maxWidth;
                    final crossAxisCount = screenWidth >= 1200
                        ? 4 // Large screens
                        : screenWidth >= 800
                        ? 3 // Medium screens
                        : 2; // Small screens

                    // Calculate the width for each MetricCard
                    final cardWidth = (screenWidth - (crossAxisCount - 1) * 16) / crossAxisCount;

                    return Wrap(
                      spacing: 16,
                      runSpacing: 16,
                      children: List.generate(
                        metrics(orderProvider).length,
                            (index) => SizedBox(
                          width: cardWidth,
                          child: MetricCard(
                            metricModel: metrics(orderProvider)[index],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Latest Orders',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OrdersScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'view all',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: _getLatestOrders().length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final order = _getLatestOrders()[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: OrderCard(order: order),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}