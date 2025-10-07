import 'package:eisty/config/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SazanAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showLogo;
  final List<Widget>? actions;

  const SazanAppBar(
      {super.key,
      this.title,
      this.showLogo = true,
      this.actions,
      });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).iconTheme.color ?? AppColors.casiNegro;

    return SafeArea(
      bottom: false,
      child: Container(
        color: Theme.of(context).appBarTheme.backgroundColor,
        child: 
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(showLogo)
              SvgPicture.asset(
                  "assets/brand/Sazan_logo_1.svg",
                  width: 35,
                  height: 35,
                  colorFilter: ColorFilter.mode(
                      Theme.of(context).iconTheme.color ?? AppColors.casiNegro,                     
                      BlendMode.srcIn),
                ),
          ],
        )
      ),
    );

  }

  @override
  Size get preferredSize =>
      Size.fromHeight(50);
}
