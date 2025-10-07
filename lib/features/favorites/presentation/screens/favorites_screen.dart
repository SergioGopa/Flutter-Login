import 'package:eisty/config/theme/theme.dart';
import 'package:eisty/features/catalog/deals/domain/domain.dart';
import 'package:eisty/features/catalog/deals/presentation/providers/storage/favorite_deals_provider.dart';
import 'package:eisty/features/favorites/presentation/widgets/widgets.dart';
import 'package:eisty/features/shared/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class FavoritesScreen extends ConsumerStatefulWidget {
  const FavoritesScreen({super.key});

  @override
  ConsumerState<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends ConsumerState<FavoritesScreen> {
  bool isLoading = false;
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() async {
    if (isLoading || isLastPage) return;
    isLoading = true;

    final deals = await ref.read(favoriteDealsProvider.notifier).loadNextPage();
    isLoading = false;

    if (deals.isEmpty) {
      isLastPage = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final favoriteDeals = ref.watch(favoriteDealsProvider);
    List<Deal> dealsList = favoriteDeals.values.toList();

    if (favoriteDeals.isEmpty) {
      final colors = Theme.of(context).colorScheme;

      return Scaffold(
        appBar: SazanAppBar(showLogo: true, ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite_outline_sharp,
                color: colors.primary,
                size: 60,
              ),
              Text(
                'Ohhh no!!!',
                style: TextStyle(fontSize: 30, color: colors.primary),
              ),
              Text(
                'No tienes promociones favoritas',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              FilledButton.tonal(
                  onPressed: () {
                    context.push('/');
                  },
                  child: const Text('Empieza a buscar'))
            ],
          ),
        ),
      );
    }
    return Scaffold(
      appBar: SazanAppBar(showLogo: true, ),
      body: Column(
        children: [
          Divider(
                color: AppColors.rosaPrimario,
                thickness: 3,
                height: 27,
              ),
          Expanded(
            child: DealMasonry(
            deals: dealsList,
            loadNextPage: loadNextPage,
            ),
          )],
      ),
    );
  }
}
