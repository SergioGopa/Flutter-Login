import 'package:eisty/features/shared/domain/entities/restaurant.dart';

abstract class RestaurantsRepository {
  Future<List<Restaurant>> getTopRatedRestaurants();
  
  Future<List<Restaurant>> getNearbyRestaurants();
  
  Future<List<Restaurant>> searchRestaurants(String query);
}
