import 'package:eisty/features/today/domain/entities/filters.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filtersProvider = StateNotifierProvider<FiltersNotifier, Filters>(
  (ref) {
    return FiltersNotifier();
  },
);

class FiltersNotifier extends StateNotifier<Filters> {
  FiltersNotifier() : super(Filters.initial());

  void toggleOpenNow() {
    state = state.copyWith(openNow: !state.openNow);
  }

  void toggleCategory(String category) {
    final categories = List<String>.from(state.categories);

    categories.contains(category)
        ? categories.remove(category)
        : categories.add(category);

    state = state.copyWith(categories: categories);
  }

  void toggleDay(String day) {
    final days = List<String>.from(state.days);

    days.contains(day) ? days.remove(day) : days.add(day);

    state = state.copyWith(days: days);
  }

  void setDistance(double km) {
    state = state.copyWith(distanceKm: km);
  }

  void toggleAdultsOnly() {
    state = state.copyWith(adultsOnly: !state.adultsOnly);
  }

  void togglePetFriendly() {
    state = state.copyWith(petFriendly: !state.petFriendly);
  }

  void toggleDelivery() {
    state = state.copyWith(delivery: !state.delivery);
  }

  void reset() {
    state = Filters.initial();
  }
}
