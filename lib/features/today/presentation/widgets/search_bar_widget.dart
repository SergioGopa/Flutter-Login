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
  
  }
}