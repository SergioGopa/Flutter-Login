import 'package:eisty/config/theme/theme.dart';
import 'package:eisty/features/catalog/deals/domain/domain.dart';
import 'package:eisty/features/catalog/deals/presentation/providers/search/search_deals_provider.dart';
import 'package:eisty/features/today/presentation/delegate/delegates.dart';
import 'package:eisty/features/today/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';

class SearchBarWidget extends ConsumerWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            GestureDetector(
                onTap: () {
                  final searchedDeals = ref.read(searchedDealsProvider);
                  final searchQuery = ref.read(searchQueryProvider);

                  showSearch<Deal?>(
                          query: searchQuery,
                          context: context,
                          delegate: SearchDealDelegate(
                              initialDeals: searchedDeals,
                              searchDeals: ref
                                  .read(searchedDealsProvider.notifier)
                                  .searchDealsByQuery))
                      .then(
                    (deal) {
                      if (deal == null) return;

                      context.push('/deals/${deal.id}');
                    },
                  );
                },
                child: HeroIcon(
                  HeroIcons.magnifyingGlass,
                  color:
                      Theme.of(context).iconTheme.color ?? AppColors.casiNegro,
                  size: 32,
                )),
            const Spacer(),
            SvgPicture.asset(
              "assets/brand/Sazan_logo_1.svg",
              width: 30,
              height: 30,
              colorFilter: ColorFilter.mode(
                  Theme.of(context).iconTheme.color ?? AppColors.casiNegro,
                  BlendMode.srcIn),
            ),
            const Spacer(),
            GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    builder: (context) => FilterBottomSheet(),
                  );
                },
                child: HeroIcon(
                  HeroIcons.adjustmentsHorizontal,
                  color:
                      Theme.of(context).iconTheme.color ?? AppColors.casiNegro,
                  size: 32,
                ))
          ],
        ),
      ),
    );
  }
}
