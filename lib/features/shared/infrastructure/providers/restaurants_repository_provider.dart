import 'package:eisty/features/shared/domain/repositories/restaurants_repository.dart';
import 'package:eisty/features/shared/infrastructure/datasources/restaurants_datasource_impl.dart';
import 'package:eisty/features/shared/infrastructure/repositories/restaurants_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final restaurantsRepositoryProvider = Provider<RestaurantsRepository>(
  (ref) {
    final datasource = RestaurantsDatasourceImpl();
    final restaurantsRepository = RestaurantsRepositoryImpl(datasource);
    return restaurantsRepository;
  },
);
