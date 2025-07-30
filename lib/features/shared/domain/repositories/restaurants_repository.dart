import 'package:eisty/features/shared/domain/entities/restaurant.dart';

abstract class RestaurantsRepository {
  Future<List<Restaurant>> getTopRatedRestaurants();
  
  Future<List<Restaurant>> getNearbyRestaurants();
  
  Future<List<Restaurant>> searchRestaurants(String query);

  Future<List<Restaurant>> getRestaurantsByPage(
      {int limit = 10, int offset = 0});

  Future<Restaurant> getRestaurantById(String id);

  Future<List<Restaurant>> getRestaurantsByCategory(String category);
}
