import 'package:eisty/features/auth/auth.dart';
import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Icon(Icons.food_bank, color: Colors.blue,),
            const SizedBox(width: 5,),
            Text('Sazan', style: titleStyle,),
            const Spacer(),
            IconButton(
              onPressed: () {
              
            }, 
            icon: Icon(Icons.search))
          ],
        ),
      ),
    );
  //   return Padding(
  //     padding: const EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
  //     child: Column(
  //       children: [
  //         CustomTextFormField(
  //           // label:
  //           hint: "What would your like to buy?",
  //           fillColor: Color(0xFFFAFAFA),
  //           prefixicon: Icons.search,
  //           suffixIcon: Icons.sort,
  //           hintStyle: TextStyle(color: Color(0xFFd0cece), fontSize: 18),
  //         )
  //       ],
  //     ),
  //   );
  }
}