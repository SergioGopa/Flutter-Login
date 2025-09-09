import 'package:eisty/features/catalog/deals/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../restaurants/presentation/providers/providers.dart';

class DealDetailStatus extends ConsumerWidget {
  final String restaurantId;
  final String dealId;

  const DealDetailStatus(
      {super.key, required this.restaurantId, required this.dealId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurantState = ref.watch(restaurantProvider(restaurantId));
    final dealState = ref.watch(dealProvider(dealId));

    if (dealState.isLoading || dealState.deal == null) {
      return const Padding(
        padding:  EdgeInsets.symmetric(horizontal: 30),
        child: SizedBox(
          height: 50,
          child: Center(child: CircularProgressIndicator(),),
        ),

        );
    }

    final deal = dealState.deal!;

    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.white, width: 2),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withValues(alpha: 0.25),
              blurRadius: 10,
              offset: Offset(0, 4))
        ]);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Row(
            children: [
              Icon(
                Icons.circle,
                color: Colors.green,
                size: 15,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  restaurantState.restaurant?.address ?? 'No Location',
                  style: GoogleFonts.inter(
                      color: Color(0xFFFDFDFD),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ),
            ],
          )),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 80,
            height: 50,
            child: DecoratedBox(
              decoration: decoration,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  FittedBox(
                      fit: BoxFit.cover,
                      child: Text('\$${deal?.originalPrice ?? '--'}',
                          style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white))),
                  Transform.rotate(
                    angle: -.5,
                    child: Container(
                      height: 3,
                      width: 70,
                      color: Colors.red,
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 80,
            height: 50,
            child: DecoratedBox(
              decoration: decoration,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: FittedBox(
                    fit: BoxFit.cover,
                    child: Text('\$${deal.discountedPrice ?? '--'}',
                        style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
