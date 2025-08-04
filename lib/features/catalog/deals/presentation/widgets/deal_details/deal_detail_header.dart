import 'package:flutter/material.dart';

class DealDetailHeader extends StatelessWidget {
  final List<String> imageUrls;

  const DealDetailHeader({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          SizedBox(
            height: 300,
            child: PageView.builder(
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  imageUrls[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Positioned(
              top: 20,
              left: 16,
              child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close), color: Colors.white,iconSize: 30)),
          Positioned(
              top: 20,
              right: 16,
              child: IconButton(onPressed: () {}, icon: Icon(Icons.share),color: Colors.white, iconSize: 30,)),
        ],
      ),
    );
  }
}
