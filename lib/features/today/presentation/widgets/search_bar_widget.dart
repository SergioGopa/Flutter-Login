import 'package:eisty/features/catalog/deals/domain/domain.dart';
import 'package:eisty/features/catalog/deals/presentation/providers/deals_repository_provider.dart';
import 'package:eisty/features/catalog/deals/presentation/providers/search/search_deals_provider.dart';
import 'package:eisty/features/today/presentation/delegate/delegates.dart';
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
                        searchDeals: ref.read(searchedDealsProvider.notifier).searchDealsByQuery
                        // (query) {
                        //   ref.read(searchQueryProvider.notifier).update(
                        //         (state) => query,
                        //       );
                        //   return dealRepository.searchDeals(query);
                        // },
                      )).then(
                    (deal) {
                      if (deal == null) return;

                      context.push('/deals/${deal.id}');
                    },
                  );
                },
                child: HeroIcon(
                  HeroIcons.magnifyingGlass,
                  color: Colors.white,
                  size: 32,
                )),
            const Spacer(),
            SvgPicture.asset(
              "assets/brand/Sazan_logo_1.svg",
              width: 30,
              height: 30,
            ),
            const Spacer(),
            GestureDetector(
                onTap: () {},
                child: HeroIcon(
                  HeroIcons.adjustmentsHorizontal,
                  color: Colors.white,
                  size: 32,
                ))
          ],
        ),
      ),
    );
  }
}
