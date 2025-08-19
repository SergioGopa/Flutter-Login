import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heroicons/heroicons.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                
              },
              child: HeroIcon(HeroIcons.magnifyingGlass, color: Colors.white,size: 32,)
              ),
            const Spacer(),
            SvgPicture.asset("assets/brand/Sazan_logo_1.svg", width: 30, height: 30, ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                
              },
              child: HeroIcon(HeroIcons.adjustmentsHorizontal, color: Colors.white, size: 32,)
              )
          ],
        ),
      ),
    );
  
  }
}