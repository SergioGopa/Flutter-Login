import 'package:eisty/config/menu/profile_menu_items.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileListTileWidget extends StatelessWidget {
  final ProfileMenuItem profileItem;
  const ProfileListTileWidget({super.key, required this.profileItem});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return InkWell(
      onTap: () => context.pushNamed(profileItem.routeName),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // SizedBox(height: 10,),
            Icon(profileItem.icon, color: Colors.amber, size: 34),
            const SizedBox(width: 16,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(profileItem.title, style: GoogleFonts.inter(color: Color(0xFFFDFDFD), fontSize: 18)),
                  if(profileItem.subtitle != null)
                    Text(profileItem.subtitle!, style: Theme.of(context).textTheme.bodySmall,)
                ],
              )
              ),
            Icon(Icons.arrow_forward_ios_rounded, color: Colors.amber, size: 34),
          ],
        ),
        ),
    );
  }
}
