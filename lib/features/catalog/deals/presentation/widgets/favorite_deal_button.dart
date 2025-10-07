import 'package:eisty/features/catalog/deals/domain/domain.dart';
import 'package:eisty/features/catalog/deals/presentation/providers/storage/favorite_deals_provider.dart';
import 'package:eisty/features/catalog/deals/presentation/providers/storage/local_storage_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isFavoriteProvider = FutureProvider.family.autoDispose(
  (ref, String dealId) {
    final localStorageRepository = ref.watch(localStorageRepositoryProvider);
    return localStorageRepository.isDealFavorite(dealId);
  },
);

class FavoriteDealButton extends ConsumerWidget {
  final Deal deal;
  final double size;
  final Color? inactiveBackground;
  final Color? activeBackground;

  const FavoriteDealButton({
    super.key,
    required this.deal,
    this.size = 36,
    this.inactiveBackground,
    this.activeBackground, 
    });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFavoriteFuture = ref.watch(isFavoriteProvider(deal.id));

    return GestureDetector(
      onTap: () async {
        await ref
      .read(favoriteDealsProvider.notifier).toggleFavorite(deal);
      ref.invalidate(isFavoriteProvider(deal.id));
      },
      child: isFavoriteFuture.when(
        data: (isFavorite) => isFavorite
            ? Icon(
                Icons.favorite,
                color: Colors.red,
                size: 36,
                shadows: [
                  Shadow(
                    blurRadius: 3,
                    color: Colors.black.withValues(alpha: 1),
                    offset: Offset(-1, 5)), 
                ],
              )
            :Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.withValues(alpha: .3)
              ),
              child: Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 36,

                ),
            ), 
        error: (error, stackTrace) => throw UnimplementedError(), 
        loading: () => CircularProgressIndicator(strokeWidth: 2,),
        ),
    );
  }
}
