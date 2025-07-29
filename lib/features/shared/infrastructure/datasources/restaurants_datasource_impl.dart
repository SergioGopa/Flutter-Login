import 'dart:convert';

import 'package:eisty/features/shared/domain/datasources/restaurants_datasource.dart';
import 'package:eisty/features/shared/domain/domain.dart';
import 'package:flutter/services.dart';

class RestaurantsDatasourceImpl extends RestaurantsDatasource {
  Future<List<Restaurant>> _loadRestaurants() async {
    final jsonString =
        await rootBundle.loadString('assets/mock/mock_restaurants.json');

    final List<dynamic> data = jsonDecode(jsonString);

    return data
        .map(
          (item) => Restaurant.fromJson(item),
        )
        .toList();
  }

  @override
  Future<List<Restaurant>> getNearbyRestaurants() async {
    final restaurants = await _loadRestaurants();

    return restaurants
        .where(
          (restaurant) => restaurant.isNearby,
        )
        .toList();
  }

  @override
  Future<List<Restaurant>> getTopRatedRestaurants() async {
    final restaurants = await _loadRestaurants();

    return restaurants
        .where(
          (restaurant) => restaurant.isTopRated,
        )
        .toList();
  }

  @override
  Future<List<Restaurant>> searchRestaurants(String query) async {
    final restaurants = await _loadRestaurants();
    final lowerQuery = query.toLowerCase();

    return restaurants
        .where(
          (restaurant) => restaurant.name.toLowerCase().contains(lowerQuery),
        )
        .toList();
  }
}
