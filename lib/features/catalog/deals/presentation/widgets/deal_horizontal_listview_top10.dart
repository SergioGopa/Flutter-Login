import 'package:eisty/features/catalog/deals/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../restaurants/presentation/providers/providers.dart';
import '../../domain/entities/deal.dart';

class DealHorizontalListviewTop10 extends StatefulWidget {
  final List<Deal> deals;
  final String? title;
  final VoidCallback? loadNextPage;
  final bool isLastPage;

  const DealHorizontalListviewTop10(
      {super.key,
      required this.deals,
      this.title,
      this.loadNextPage,
      this.isLastPage = false});

  @override
  State<DealHorizontalListviewTop10> createState() =>
      _DealHorizontalListviewTop10State();
}

class _DealHorizontalListviewTop10State
    extends State<DealHorizontalListviewTop10> {
  final scrollController = ScrollController();
  bool _isRequestInProgress = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(
      () {
        if (widget.loadNextPage == null) return;

        if ((scrollController.position.pixels + 200) >=
            scrollController.position.maxScrollExtent) {
          if (_isRequestInProgress) return;

          _isRequestInProgress = true;
          widget.loadNextPage!();

          if (widget.isLastPage) {
            scrollController.animateTo(0,
                duration: const Duration(
                  milliseconds: 400,
                ),
                curve: Curves.easeInOut);
          }
          Future.delayed(const Duration(milliseconds: 500), () {
            _isRequestInProgress = false;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Column(
        children: [
          if (widget.title != null)
            _Title(
              title: widget.title,
            ),
          const SizedBox(
            height: 5,
          ),
          Expanded(
              child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: widget.deals.length,
            itemBuilder: (context, index) {
              return _Slide(
                deal: widget.deals[index],
                index: index,
              );
            },
          ))
        ],
      ),
    );
  }
}



class _Slide extends ConsumerWidget {
  final Deal deal;
  final int index;

  const _Slide({required this.deal, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurantAsync =
        ref.watch(restaurantByIdProvider(deal.restaurantId));
    
    final double cardWidth = 180.0;

    return Container(
      margin: EdgeInsets.only(left: index == 0 ? 8 : 6),
      width: cardWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Image
          Stack(
            children: [
              SizedBox(
                width: cardWidth,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: GestureDetector(
                    onTap: () {
                      context.push('/deals/${deal.id}');
                    },
                    child: Image.asset(
                      deal.imageUrl,
                      width: 25,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                // top: 10,
                  child: FavoriteDealButton(deal: deal),
              )
              // Positioned(
              //     right: 10,
              //     top: 10,
              //     child: Container(
              //         padding: const EdgeInsets.all(2),
              //         decoration: BoxDecoration(
              //             color: Colors.black38, shape: BoxShape.circle),
              //         child: Icon(
              //           Icons.favorite_border,
              //           color: Colors.white,
              //           size: 36,
              //         ))),
              // Positioned(
              //     right: 10,
              //     top: 40,
              //     child: Icon(
              //       Icons.favorite_border,
              //       color: Colors.white,
              //       size: 36,
              //       shadows: [
              //         Shadow(
              //             blurRadius: 3,
              //             color: Colors.black.withValues(alpha: 1),
              //             offset: Offset(1, 2))
              //       ],
              //     )),
            ],
          ),

          const SizedBox(
            height: 2,
          ),

          restaurantAsync.when(
            data: (restaurant) {
              if (restaurant == null) return const SizedBox();

              return SizedBox(
                  width: 160,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: GoogleFonts.workSans(
                            color: Color(0xFFFDFDFD), fontSize: 16),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      if (restaurant.categories.isNotEmpty)
                        Text(
                          restaurant.categories.take(2).join('/'),
                          style: GoogleFonts.workSans(
                              color: Color(0xFFFDFDFD), fontSize: 12),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.circle,
                            color: Colors.green,
                            size: 10,
                          ),
                          //TODO: Open/Closed
                          Text(
                            'Abierto',
                            style: GoogleFonts.workSans(
                                color: Color(0xFFFDFDFD), fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Text(
                            " | ",
                            style: TextStyle(color: Color(0xFFFDFDFD)),
                          ),
                          //TODO: Distance
                          Text(
                            '3 Km',
                            style: GoogleFonts.workSans(
                                color: Color(0xFFFDFDFD), fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          Text(
                            " | ",
                            style: TextStyle(color: Color(0xFFFDFDFD)),
                          ),
                          // Image.asset("assets/brand/logo_google.png"),
                          Icon(
                            Icons.star_rounded,
                            color: Colors.amberAccent,
                            size: 14,
                          ),
                          Text(
                            restaurant.rating.toString(),
                            style: GoogleFonts.workSans(
                                color: Color(0xFFFDFDFD), fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ],
                  ));
            },
            error: (error, stackTrace) => Text('Error: $error'),
            loading: () => const SizedBox(
              height: 32,
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  const _Title({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Spacer(),
          if (title != null)
            Text(title!,
                style: GoogleFonts.montserratAlternates(
                    color: Color(0xFFFCD73D),
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
          const Spacer(),
        ],
      ),
    );
  }
}
