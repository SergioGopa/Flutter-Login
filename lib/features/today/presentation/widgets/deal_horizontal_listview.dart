
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../catalog/deals/domain/entities/deal.dart';

class DealHorizontalListview extends StatefulWidget {
  final List<Deal> deals;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;
  final bool isLastPage;

  const DealHorizontalListview(
      {super.key,
      required this.deals,
      this.title,
      this.subTitle,
      this.loadNextPage,
      this.isLastPage = false});

  @override
  State<DealHorizontalListview> createState() => _DealHorizontalListviewState();
}

class _DealHorizontalListviewState extends State<DealHorizontalListview> {
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

          print('Load next deals');

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
      height: 280,
      child: Column(
        children: [
          if (widget.title != null || widget.subTitle != null)
            _Title(
              title: widget.title,
              subTitle: widget.subTitle,
            ),
          Expanded(
              child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: widget.deals.length,
            itemBuilder: (context, index) {
              return _Slide(deal: widget.deals[index]);
            },
          ))
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Deal deal;

  const _Slide({required this.deal});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Image
          SizedBox(
            width: 120,
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

          const SizedBox(
            height: 5,
          ),

          SizedBox(
            width: 150,
            child: Text(
              deal.title,
              maxLines: 2,
              style: textStyles.titleSmall,
            ),
          ),

          Row(
            children: [
              Text(
                '\$${deal.originalPrice}',
                style: TextStyle(decoration: TextDecoration.lineThrough),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                '\$${deal.discountedPrice}',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;
  const _Title({super.key, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.only(top: 20),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null)
            Text(
              title!,
              style: titleStyle,
            ),
          const Spacer(),
          if (subTitle != null)
            FilledButton.tonal(
                style: const ButtonStyle(visualDensity: VisualDensity.compact),
                onPressed: () {},
                child: Text(subTitle!))
        ],
      ),
    );
  }
}
