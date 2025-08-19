import 'package:eisty/features/catalog/deals/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DealDetailBottomBar extends ConsumerStatefulWidget {
  final DealDetails deal;
  const DealDetailBottomBar({super.key, required this.deal});

  @override
  ConsumerState<DealDetailBottomBar> createState() =>
      _DealDetailBottomBarState();
}

class _DealDetailBottomBarState extends ConsumerState<DealDetailBottomBar> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final totalPrice = (widget.deal.price * quantity).toStringAsFixed(2);

    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)]),
        child: Row(
          children: [
            IconButton(
                onPressed:
                    quantity > 1 ? () => setState(() => quantity--) : null,
                icon: const Icon(Icons.remove)),
            Text(quantity.toString()),
            IconButton(
                onPressed: () => setState(() => quantity++),
                icon: const Icon(Icons.add)),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Added $quantity to cart')),
                  );
                },
                child: Text('Add to Cart - \$$totalPrice')
                )
          ],
        ),
      ),
    );
  }
}
