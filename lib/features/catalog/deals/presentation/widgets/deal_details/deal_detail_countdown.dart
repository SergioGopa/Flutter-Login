import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../restaurants/presentation/providers/providers.dart';

class DealDetailCountdown extends ConsumerWidget {
  final String restaurantId;
  final DateTime endDate;

  const DealDetailCountdown(
      {super.key, required this.restaurantId, required this.endDate});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurantState = ref.watch(restaurantProvider(restaurantId));
    final restaurant = restaurantState.restaurant;
    final now = DateTime.now();
    final diff = endDate.difference(now);

    // if (restaurant == null) {
    //   return Center(
    //     child: CircularProgressIndicator(),
    //   );
    // }

    String message;

    if (diff.isNegative) {
      message = 'Finalizado';
    } else if (diff.inDays > 0){
       message = "¡Termina en ${diff.inDays} días!";
    } else if (diff.inHours > 0) {
      message = "¡Quedan ${diff.inHours}h ${diff.inMinutes % 60}m!";
    } else {
      message = "¡Quedan ${diff.inMinutes} minutos!";
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Color(0xFFCB087B),
        
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.timer, color: Colors.white,),
          const SizedBox(width: 8,),
          Text(message, style: GoogleFonts.inter(color: Color(0xFFFDFDFD), fontSize: 18, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic ),)
        ],
      ),
    );
  }
}
