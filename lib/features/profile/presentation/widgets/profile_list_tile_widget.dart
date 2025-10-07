import 'package:eisty/config/menu/profile_menu_items.dart';
import 'package:eisty/config/theme/theme.dart';
import 'package:eisty/features/auth/auth.dart';
import 'package:eisty/features/profile/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileListTileWidget extends ConsumerWidget {
  final ProfileMenuItem profileItem;
  const ProfileListTileWidget({super.key, required this.profileItem});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSignout = profileItem.routeName == '/signout';
    final theme = ref.watch(themeNotifierProvider);

    return InkWell(
      onTap: () {
        if (isSignout) {
          ref.read(authProvider.notifier).logout();
          context.go('/login');
        } else if (profileItem.onTap != null) {
          profileItem.onTap!();
        } else if (profileItem.routeName != null) {
          context.pushNamed(profileItem.routeName!);
        }
      },

      // profileItem.onTap ?? () => context.pushNamed(profileItem.routeName!),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(profileItem.icon, 
            color: theme.brightness == Brightness.dark
                            ? AppColors.blancoSazan
                            : AppColors.casiNegro
            , size: 34),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(profileItem.title,
                    style: GoogleFonts.inter(
                        color: theme.brightness == Brightness.dark
                            ? AppColors.blancoSazan
                            : AppColors.casiNegro,
                        fontSize: 18)),
                if (profileItem.subtitle != null)
                  Text(
                    profileItem.subtitle!,
                    style: Theme.of(context).textTheme.bodySmall,
                  )
              ],
            )),
            if (!isSignout)
              Icon(Icons.arrow_forward_ios_rounded,
                  color: theme.brightness == Brightness.dark
                            ? AppColors.blancoSazan
                            : AppColors.casiNegro,
                  size: 34),
          ],
        ),
      ),
    );
  }
}
