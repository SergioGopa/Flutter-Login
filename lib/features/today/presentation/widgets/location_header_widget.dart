// location_header.dart
import 'package:flutter/material.dart';

class LocationHeaderWidget extends StatelessWidget {
  final String city;
  const LocationHeaderWidget({required this.city});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //TODO: Implement with GPS Location
        Icon(Icons.location_on),
        Text('Deals in $city', style: TextStyle(fontSize: 15),),
      ],
    );
  }
}