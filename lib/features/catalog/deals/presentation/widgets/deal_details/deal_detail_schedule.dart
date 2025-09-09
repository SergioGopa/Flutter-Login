import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../restaurants/presentation/providers/providers.dart';

class DealDetailSchedule extends ConsumerWidget {
  
  final String restaurantId;

  const DealDetailSchedule({
    Key? key,
    required this.restaurantId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurantState = ref.watch(restaurantProvider(restaurantId));
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          if(restaurantState.restaurant != null)
            Row(
              children: [
                Icon(Icons.timer),
                Text(
                  restaurantState.restaurant!.latitude.toString() ?? 'No horario', 
                  style: GoogleFonts.inter(color: Color(0xFFFDFDFD), fontSize: 16, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 3,),
              ],
            ),
          const SizedBox(height: 8,),
    
        ],
      ),
      );
  }
}
