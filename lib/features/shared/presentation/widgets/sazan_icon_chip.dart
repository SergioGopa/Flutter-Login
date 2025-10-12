import 'package:eisty/config/theme/theme.dart';
import 'package:flutter/material.dart';

class SazanIconChip extends StatelessWidget {
  final String label;
  final String iconPath;
  final bool selected;
  final VoidCallback onTap;
  final double size;
  const SazanIconChip(
      {super.key,
      required this.label,
      required this.iconPath,
      required this.selected,
      required this.onTap,
      required this.size});

  @override
  Widget build(BuildContext context) {
    final color =
        selected ? AppColors.rosaPrimario : Colors.white.withValues(alpha: 0.8);
    final iconColor =
        selected ? AppColors.blancoSazan : Colors.white.withValues(alpha: 0.8);
    final textColor = selected ? AppColors.blancoSazan : AppColors.blancoSazan;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 3))
                ]),
            width: 65,
            height: 65,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                iconPath,
                // color: selected ? AppColors.blancoSazan : null,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.w600,
              fontSize: 12
              ),
          )
        ],
      ),
    );
  }
}
