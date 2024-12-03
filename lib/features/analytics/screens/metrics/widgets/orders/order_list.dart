import '../../../../../../core/utils/exports.dart';

class OrderList extends StatelessWidget {
 final List<Order> orders;
  const OrderList({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: OrderCard(order: order),
        );
      },
    );
  }
}