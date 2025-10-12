class Restaurant {
  final String id;
  final String name;
  final String address;
  final double rating; // average rating
  final int reviewsCount; // number of reviews
  final String imageUrl;
  final double latitude;
  final double longitude;
  final List<String> dealIds;

  // Categorization / Filtering
  final bool isTopRated; // for "Top Rated Restaurants"
  final bool isNearby; // for "Nearby"
  final List<String> categories; // e.g. ["Mexican", "Fast Food"]
  final List<Map<String, dynamic>> openingHours;

  Restaurant({
    required this.dealIds,
    required this.id,
    required this.name,
    required this.address,
    required this.rating,
    required this.reviewsCount,
    required this.imageUrl,
    required this.latitude,
    required this.longitude,
    this.isTopRated = false,
    this.isNearby = false,
    this.categories = const [],
    this.openingHours = const [],
  });

  Restaurant copyWith({
    List<String>? dealIds,
    String? id,
    String? name,
    String? address,
    double? rating,
    int? reviewsCount,
    String? imageUrl,
    double? latitude,
    double? longitude,
    bool? isTopRated,
    bool? isNearby,
    List<String>? categories,
    List<Map<String, dynamic>>? openingHours,
  }) {
    return Restaurant(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      rating: rating ?? this.rating,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      imageUrl: imageUrl ?? this.imageUrl,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      dealIds: dealIds ?? this.dealIds,
      isTopRated: isTopRated ?? this.isTopRated,
      isNearby: isNearby ?? this.isNearby,
      categories: categories ?? this.categories,
      openingHours: openingHours ?? this.openingHours,
    );
  }

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        dealIds: List<String>.from(json['dealIds'] ?? []),
        id: json['id'],
        name: json['name'],
        address: json['address'],
        rating: (json['rating'] as num).toDouble(),
        reviewsCount: json['reviewsCount'] ?? 0,
        imageUrl: json['imageUrl'],
        latitude: (json['latitude'] as num).toDouble(),
        longitude: (json['longitude'] as num).toDouble(),
        isTopRated: json['isTopRated'] ?? false,
        isNearby: json['isNearby'] ?? false,
        categories: List<String>.from(json['categories'] ?? []),
        openingHours: (json['openingHours'] as List<dynamic>?)
                ?.map(
                  (e) => Map<String, dynamic>.from(e),
                )
                .toList() ??
            [],
      );

  Map<String, dynamic> toJson() => {
        'dealIds': dealIds,
        'id': id,
        'name': name,
        'address': address,
        'rating': rating,
        'reviewsCount': reviewsCount,
        'imageUrl': imageUrl,
        'latitude': latitude,
        'longitude': longitude,
        'isTopRated': isTopRated,
        'isNearby': isNearby,
        'categories': categories,
        'openingHours': openingHours,
      };

  bool isOpenNow() {
    if (openingHours.isEmpty) return false;

    final now = DateTime.now();
    final weekday = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ][now.weekday - 1];

    final today = openingHours.firstWhere(
      (entry) => entry['day'] == weekday,
      orElse: () => {},
    );

    if (today.isEmpty) return false;

    final windows = today['windows'] as List<dynamic>? ?? [];

    for (final window in windows) {
      final startParts = (window['start'] as String).split(':');
      final endParts = (window['end'] as String).split(':');

      final start = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(startParts[0]),
        int.parse(startParts[1]),
      );

      final end = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(endParts[0]),
        int.parse(endParts[1]),
      );

      if (now.isAfter(start) && now.isBefore(end)) {
        return true;
      }
    }
    return false;
  }
}
