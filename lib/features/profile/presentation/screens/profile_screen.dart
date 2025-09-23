import 'package:eisty/features/profile/presentation/widgets/profile_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/menu/profile_menu_items.dart';

class ProfileScreen extends StatelessWidget {
  static const String name = 'profile-screen';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SvgPicture.asset(
              "assets/brand/Sazan_logo_1.svg",
              width: 35,
              height: 35,
            ),
      ),
      body: Column(
        children: [
          const Divider(color: Color(0xFFCB087B),thickness: 3,),
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
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: profileMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = profileMenuItems[index];
        final tile = ProfileListTileWidget(profileItem: menuItem);
        List<Widget> widgets = [];

        widgets.add(tile);

        if (menuItem.title != "Cerrar sesion") {
          widgets.add(const Divider(
            color: Colors.amber,
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
