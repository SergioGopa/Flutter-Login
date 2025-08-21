import 'package:flutter/material.dart';

class CategoryChipsWidget extends StatelessWidget {
  const CategoryChipsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          TopMenuTiles(name: 'Burger', imageUrl: 'ic_burger', slug: ""),
          TopMenuTiles(name: "Sushi", imageUrl: "ic_sushi", slug: ""),
          TopMenuTiles(name: "Pizza", imageUrl: "ic_pizza", slug: ""),
          TopMenuTiles(name: "Cake", imageUrl: "ic_cake", slug: ""),
          TopMenuTiles(name: "Ice Cream", imageUrl: "ic_ice_cream", slug: ""),
          TopMenuTiles(name: "Soft Drink", imageUrl: "ic_soft_drink", slug: ""),
          TopMenuTiles(name: "Burger", imageUrl: "ic_burger", slug: ""),
          TopMenuTiles(name: "Sushi", imageUrl: "ic_sushi", slug: ""),
        ],
      ),
    );
  }
}

class TopMenuTiles extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String slug;
  
  const TopMenuTiles({
    super.key, 
    required this.name,
    required this.imageUrl,
    required this.slug,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 6, 6, 6),
                  blurRadius: 30.0,
                  offset: Offset(0.0, 0.1)
                )
              ]
            ),
            child: Card(
              color: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),

              ),
              child: SizedBox(
                
                width: 60,
                height: 60,
                child: Center(
                  child: Image.asset("assets/images/topmenu/$imageUrl.png", width: 35, height: 35,),
                ),
              ),
            ),
          ),
          Text(name, style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
