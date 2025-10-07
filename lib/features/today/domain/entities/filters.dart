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

  const Filters( 
      {this.openNow = false,
      this.categories = const [],
      this.days = const [],
      this.distanceKm = 5,
      this.adultsOnly = false,
      this.petFriendly = false,
      this.delivery = false,
      this.validToday = false, 
      this.popular = false, 
      this.featured = false, 
      this.upcoming = false,
      });

  Filters copyWith({
    bool? openNow,
    List<String>? categories,
    List<String>? days,
    double? distanceKm,
    bool? adultsOnly,
    bool? petFriendly,
    bool? delivery,
    bool? validToday,
    bool? popular,
    bool? features,
    bool? upcoming,
  }) {
    return Filters(
      openNow: openNow ?? this.openNow,
      categories: categories ?? this.categories,
      days: days ?? this.days,
      distanceKm: distanceKm ?? this.distanceKm,
      adultsOnly: adultsOnly ?? this.adultsOnly,
      petFriendly: petFriendly ?? this.petFriendly,
      delivery: delivery ?? this.delivery,
      validToday : validToday ?? this.validToday,
      popular : popular ?? this.popular,
      featured : features ?? this.featured,
      upcoming : upcoming ?? this.upcoming,
    );
  }

  static Filters initial() => const Filters();
}
