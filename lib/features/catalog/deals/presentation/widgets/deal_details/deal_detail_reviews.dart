import 'package:eisty/features/catalog/deals/domain/domain.dart';
import 'package:flutter/material.dart';

class DealDetailReviews extends StatelessWidget {
  final List<Review> reviews;
  const DealDetailReviews({super.key, required this.reviews});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: reviews.map((review) => ListTile(
          title: Text(review.user),
          subtitle: Text(review.comment),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("${review.rating}/5"),
              SizedBox(width: 10,),
              Icon(Icons.star_half_outlined, color: Colors.yellow.shade800,),
              
            ],
          ),
        ),).toList(),
      ),
    );
  }
}
