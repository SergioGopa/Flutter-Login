import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../../shared/domain/domain.dart';

class HeroCarouselWidget extends StatelessWidget {
  HeroCarouselWidget({
    super.key,
  });

  final List<Deal>? featureDeals = [
    Deal(
      id: '1',
      title: '2x1 Tacos al Pastor',
      description: 'Only from 5 PM to 8 PM — dine-in only.',
      imageUrl: 'https://example.com/images/tacos.jpg',
      type: 'Food',
      validUntil: DateTime.now().add(Duration(hours: 3)),
      restaurantId: 'r1',
      originalPrice: 120.0,
      discountedPrice: 60.0,
      isFeatured: true,
    ),
    Deal(
      id: '2',
      title: 'Happy Hour Margaritas',
      description: 'Buy one get one free on all margaritas!',
      imageUrl: 'https://example.com/images/margarita.jpg',
      type: 'Drink',
      validUntil: DateTime.now().add(Duration(hours: 2)),
      restaurantId: 'r2',
      originalPrice: 180.0,
      discountedPrice: 90.0,
      isFeatured: true,
    ),
    Deal(
      id: '3',
      title: 'Free Dessert with Any Entrée',
      description: 'Get a complimentary dessert of your choice.',
      imageUrl: 'https://example.com/images/dessert.jpg',
      type: 'Dessert',
      validUntil: DateTime.now().add(Duration(days: 1)),
      restaurantId: 'r3',
      originalPrice: null,
      discountedPrice: 0.0,
      isFeatured: true,
    ),
    Deal(
      id: '4',
      title: 'Combo Lunch for 99 MXN',
      description: 'Main dish, side, and drink included.',
      imageUrl: 'https://example.com/images/lunch_combo.jpg',
      type: 'Food',
      validUntil: DateTime.now().add(Duration(hours: 5)),
      restaurantId: 'r4',
      originalPrice: 150.0,
      discountedPrice: 99.0,
      isFeatured: true,
    ),
    Deal(
      id: '5',
      title: '50% Off Sushi Rolls',
      description: 'Valid all day today on select rolls.',
      imageUrl: 'https://example.com/images/sushi.jpg',
      type: 'Food',
      validUntil: DateTime.now().add(Duration(hours: 10)),
      restaurantId: 'r5',
      originalPrice: 240.0,
      discountedPrice: 120.0,
      isFeatured: true,
    ),
    Deal(
      id: '6',
      title: 'Breakfast Special: Coffee + Pastry',
      description: 'Only 49 before 11 AM.',
      imageUrl: 'https://example.com/images/breakfast.jpg',
      type: 'Food',
      validUntil: DateTime.now().add(Duration(hours: 1)),
      restaurantId: 'r6',
      originalPrice: 70.0,
      discountedPrice: 49.0,
      isFeatured: true,
    ),
    Deal(
      id: '7',
      title: '2 for 1 Craft Beers',
      description: 'Chill with friends from 6 to 9 PM.',
      imageUrl: 'https://example.com/images/beers.jpg',
      type: 'Drink',
      validUntil: DateTime.now().add(Duration(hours: 4)),
      restaurantId: 'r7',
      originalPrice: 160.0,
      discountedPrice: 80.0,
      isFeatured: true,
    ),
    Deal(
      id: '8',
      title: 'Pizza Night Deal',
      description: 'Large pizza + 2 drinks for 199.',
      imageUrl: 'https://example.com/images/pizza.jpg',
      type: 'Food',
      validUntil: DateTime.now().add(Duration(hours: 6)),
      restaurantId: 'r8',
      originalPrice: 260.0,
      discountedPrice: 199.0,
      isFeatured: true,
    ),
    Deal(
      id: '9',
      title: 'Free Kids Meal',
      description: 'With purchase of two adult meals.',
      imageUrl: 'https://example.com/images/kids_meal.jpg',
      type: 'Food',
      validUntil: DateTime.now().add(Duration(days: 2)),
      restaurantId: 'r9',
      originalPrice: 70.0,
      discountedPrice: 0.0,
      isFeatured: true,
    ),
    Deal(
      id: '10',
      title: 'Afternoon Tea for 2',
      description: 'Includes pastries and unlimited tea.',
      imageUrl: 'https://example.com/images/tea.jpg',
      type: 'Drink',
      validUntil: DateTime.now().add(Duration(hours: 8)),
      restaurantId: 'r10',
      originalPrice: 200.0,
      discountedPrice: 130.0,
      isFeatured: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        itemCount: featureDeals?.length ?? 0,
        itemBuilder: (context, index) {
          final deal = featureDeals![index];
          return _Slide(deal: deal);
        },
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Deal deal;
  const _Slide({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
