import 'package:eisty/config/theme/theme.dart';
import 'package:eisty/features/profile/presentation/widgets/profile_list_tile_widget.dart';
import 'package:eisty/features/shared/presentation/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/menu/profile_menu_items.dart';


class ProfileScreen extends ConsumerWidget {
  static const String name = 'profile-screen';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    
    return Scaffold(

      appBar: SazanAppBar(showLogo: true,),
      body: Column(
        children: [
          Divider(color: AppColors.rosaPrimario,thickness: 3,height: 27,),
          Expanded(child: _ProfileScreen())
          ]
        ),
    );
  }
}

class _ProfileScreen extends StatelessWidget {
  const _ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    

    return ListView.builder(
      itemCount: profileMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = profileMenuItems[index];
        final tile = ProfileListTileWidget(profileItem: menuItem);
        List<Widget> widgets = [];

        widgets.add(tile);

        if (menuItem.title != "Cerrar sesion") {
          widgets.add( Divider(
            color: colors.primary,
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ));
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: widgets,
        );
      },
    );
  }
}
