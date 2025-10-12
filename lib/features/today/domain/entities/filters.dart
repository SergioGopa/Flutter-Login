class Filters {
  final bool openNow;
  final List<String> categories;
  final List<String> days;
  final double distanceKm;
  final bool adultsOnly;
  final bool petFriendly;
  final bool delivery;

  final bool validToday;
  final bool popular;
  final bool featured;
  final bool upcoming;

  
  final List<String> selectedCategories;
  final double maxDistanceKm;

  const Filters({
    this.openNow = false,
    this.categories = const [],
    this.selectedCategories = const [],
    this.days = const [],
    this.distanceKm = 5,
    this.adultsOnly = false,
    this.petFriendly = false,
    this.delivery = false,
    this.validToday = false,
    this.popular = false,
    this.featured = false,
    this.upcoming = false,
    this.maxDistanceKm = 0.0,
  });

  Filters copyWith({
    bool? openNow,
    List<String>? categories,
    List<String>? selectedCategories,
    List<String>? days,
    double? distanceKm,
    bool? adultsOnly,
    bool? petFriendly,
    bool? delivery,
    bool? validToday,
    bool? popular,
    bool? featured,
    bool? upcoming,
    double? maxDistanceKm,

  }) {
    return Filters(
      openNow: openNow ?? this.openNow,
      categories: categories ?? this.categories,
      selectedCategories: selectedCategories ?? this.selectedCategories,
      days: days ?? this.days,
      distanceKm: distanceKm ?? this.distanceKm,
      adultsOnly: adultsOnly ?? this.adultsOnly,
      petFriendly: petFriendly ?? this.petFriendly,
      delivery: delivery ?? this.delivery,
      validToday: validToday ?? this.validToday,
      popular: popular ?? this.popular,
      featured: featured ?? this.featured,
      upcoming: upcoming ?? this.upcoming,
      maxDistanceKm: maxDistanceKm ?? this.maxDistanceKm
    );
  }

  static Filters initial() => const Filters();
}
