import 'package:eisty/features/catalog/deals/presentation/providers/storage/favorite_deals_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SavedPromosScreen extends ConsumerWidget {
  static const String name = 'promos-screen';
  const SavedPromosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteDealsMap = ref.watch(favoriteDealsProvider);
    final deals = favoriteDealsMap.values.toList();

    if (deals.isEmpty) {
      return Scaffold(
        body: Center(child: Text('No hay promociones guardadas!!'),),
      );
    }
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Saved Promos Screen'),
      ),
    );
  }
}
