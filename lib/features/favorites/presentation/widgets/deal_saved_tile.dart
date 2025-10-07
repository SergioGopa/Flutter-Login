import 'package:eisty/features/catalog/deals/domain/domain.dart';
import 'package:eisty/features/catalog/deals/presentation/widgets/favorite_deal_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DealSavedTile extends StatelessWidget {
  final Deal deal;
  final VoidCallback? onRemove;
  const DealSavedTile({super.key, required this.deal, this.onRemove});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: GestureDetector(
              onTap: () {
                context.push('/deals/${deal.id}');
              },
              child: Image.asset(
                deal.imageUrl,
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
          ),
      title: Text(deal.title, style: TextStyle(fontWeight: FontWeight.bold),),
      subtitle: Text(deal.description, maxLines: 1, overflow: TextOverflow.ellipsis,),
      trailing: FavoriteDealButton(deal: deal),
      // IconButton(onPressed: onRemove, icon: const Icon(Icons.delete, color: Colors.redAccent,)),
      onTap: () {
        context.push('/deals/${deal.id}');
      },
    );
  }
}
