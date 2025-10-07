import 'package:eisty/features/catalog/deals/domain/domain.dart';
import 'package:eisty/features/favorites/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class DealMasonry extends StatefulWidget {
  final List<Deal> deals;
  final VoidCallback? loadNextPage;
  const DealMasonry({super.key, required this.deals, this.loadNextPage});

  @override
  State<DealMasonry> createState() => _DealMasonryState();
}

class _DealMasonryState extends State<DealMasonry> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(
      () {
        if (widget.loadNextPage == null) return;

        if ((scrollController.position.pixels + 100) >=
            scrollController.position.maxScrollExtent) {
          widget.loadNextPage!();
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      controller: scrollController,
      crossAxisCount: 3,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      itemCount: widget.deals.length + 1,
      itemBuilder: (context, index) {
        if (index == 1) {
          return SizedBox(
            height: 30,
          );
        }
        final dealIndex = index > 1 ? index - 1 : index;

        return DealPosterLink(deal: widget.deals[dealIndex]);
      },
    );
  }
}
