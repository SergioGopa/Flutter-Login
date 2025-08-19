import 'package:eisty/features/catalog/deals/domain/domain.dart';
import 'package:flutter/material.dart';

class DealDetailOptions extends StatelessWidget {
  final DealDetails deal;

  const DealDetailOptions({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: deal.options.map(
          (group) {
            return Column(
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text("${group.name} ${group.isRequired ? '*':''}",style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                ...group.items.map((item) => ListTile(
                  title: Text(item.name),
                  trailing: item.price != null ? Text("+\$${item.price}"):null,
                ),)
              ],
            );
          },
        ).toList(),
      ),
    );
  }
}
