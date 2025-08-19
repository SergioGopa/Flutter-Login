import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroicons/heroicons.dart';

class CustomBottomNavbar extends ConsumerWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const CustomBottomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  
  static const _bg = Colors.white;
  static const _shadow = Color(0x33000000); // 20% black

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 12),
        child: Container(
          height: 72,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
              color: _bg,
              boxShadow: [
                BoxShadow(color: _shadow, blurRadius: 18, offset: Offset(0, 8))
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _NavItem(index: 0, currentIndex: currentIndex, label: 'Home', icon: HeroIcon(HeroIcons.home, style: HeroIconStyle.outline), onTap: onTabSelected, selectedIsBubble: true,),
              _NavItem(index: 1, currentIndex: currentIndex, label: 'Mapa', icon: HeroIcon(HeroIcons.mapPin, style: HeroIconStyle.outline), onTap: onTabSelected, selectedIsBubble: true,),
              _NavItem(index: 2, currentIndex: currentIndex, label: 'Lugares', icon: HeroIcon(HeroIcons.buildingStorefront, style: HeroIconStyle.outline), onTap: onTabSelected,selectedIsBubble: true),
              _NavItem(index: 3, currentIndex: currentIndex, label: 'Perfil', icon: HeroIcon(HeroIcons.userCircle, style: HeroIconStyle.outline), onTap: onTabSelected,selectedIsBubble: true),
            ],
          )
          
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final int index;
  final int currentIndex;
  final String label;
  final Widget icon;
  final ValueChanged<int> onTap;
  final bool selectedIsBubble;

  const _NavItem({
    super.key,
    required this.index,
    required this.currentIndex,
    required this.label,
    required this.icon,
    required this.onTap,
    this.selectedIsBubble = false,
  });

  static const _pink = Color(0xFFCB087B);
  static const _iconInactive = Color(0xFF8E8E93);

  @override
  Widget build(BuildContext context) {
    final selected = index == currentIndex;

    final iconColor = selected ? _pink : _iconInactive;
    final scale = selected ? 1.12 : 1.0;

    Widget iconWidget = AnimatedScale(
      scale: scale,
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      child: IconTheme(
        data: IconThemeData(color: iconColor, size: 24), 
        child: icon
        )
    );

    if (selected && selectedIsBubble) {
      iconWidget = Stack(
        alignment:  Alignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: 53,
            height: 53  ,
            decoration: BoxDecoration(
              color: _pink,
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  color:  Color(0x55CB087B),
                  blurRadius: 16,
                  offset: Offset(0, 6)
                )
              ]
            ),
            ),
          IconTheme(data: IconThemeData(color: Colors.white, size: 32), child: icon),
        ],
      );
    }
    return Expanded(
      child: InkWell(
        borderRadius: BorderRadius.circular(32),
        onTap: () => onTap(index),
        child: Transform.translate(
          offset: selected ? const Offset(0, -26):Offset.zero,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: selected? 2:20),
              selected
                ? ZoomIn(
                  duration: const Duration(milliseconds: 1500),
                  child: iconWidget
                  )
                : FadeIn(
                  duration:  const Duration(milliseconds: 1200),
                  child: iconWidget,
                  ),
              SizedBox(height: selected ? 5 : 8  ,),
              AnimatedOpacity(
                opacity: selected?1:0, 
                duration: const Duration(milliseconds: 150),
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: selected ? _pink : Colors.transparent,
                    height: 1,
                  ),
                ),
                ),
              // const SizedBox(height: 0,)
            ],
          ),
        ),
      )
      );
  }
}
