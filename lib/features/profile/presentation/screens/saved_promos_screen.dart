import 'package:eisty/features/catalog/deals/presentation/providers/storage/favorite_deals_provider.dart';
import 'package:eisty/features/favorites/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SavedPromosScreen extends ConsumerWidget {
  static const String name = 'promos-screen';
  const SavedPromosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteDealsMap = ref.watch(favoriteDealsProvider);
    final favorites = favoriteDealsMap.values.toList();

    if (favorites.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Mis Promos Guardadas'),
        ),
        body: Center(
          child: Text(
            'No hay promociones guardadas!!',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Promos Guardadas'),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final deal = favorites[index];
          return DealSavedTile(
            deal: deal,
            onRemove: () => ref.read(favoriteDealsProvider.notifier).toggleFavorite(deal),
            );
        },
      ),
    );
  }
}
