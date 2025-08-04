
import 'package:flutter/material.dart';

import '../../domain/domain.dart';

class RestaurantHorizontalListview extends StatefulWidget {
  final List<Restaurant> restaurants;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;
  final bool isLastPage;

  const RestaurantHorizontalListview({
    super.key,
    required this.restaurants,
    this.title,
    this.subTitle,
    this.loadNextPage,
    this.isLastPage = false
  });

  @override
  State<RestaurantHorizontalListview> createState() => _RestaurantHorizontalListviewState();
}

class _RestaurantHorizontalListviewState extends State<RestaurantHorizontalListview> {
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
            itemCount: widget.restaurants.length,
            itemBuilder: (context, index) {
              return _Slide(restaurant: widget.restaurants[index]);
            },
          ))
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Restaurant restaurant;

  const _Slide({required this.restaurant});

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
              child: Image.asset(
                restaurant.imageUrl,
                width: 25,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(
            height: 5,
          ),

          SizedBox(
            width: 150,
            child: Text(
              restaurant.name,
              maxLines: 2,
              style: textStyles.titleSmall,
            ),
          ),

          Row(
            children: [
              Icon(Icons.star_half_outlined, color: Colors.yellow.shade800,),
              
              Text(
                '${restaurant.rating}',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              SizedBox(
                width: 30,
              ),
              Icon(Icons.reviews, color: Colors.yellow.shade800,),
              Text(
                '${restaurant.reviewsCount}',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
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
