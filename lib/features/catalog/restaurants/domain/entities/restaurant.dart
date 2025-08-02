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
  });

  Restaurant copyWith({
    String? id,
    String? name,
    String? address,
    double? rating,
    int? reviewsCount,
    String? imageUrl,
    double? latitude,
    double? longitude,
    List<String>? dealIds,
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
        );
  }

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
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
        dealIds: List<String>.from(json['dealIds'] ?? []),
      );

  Map<String, dynamic> toJson() => {
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
        'dealIds':dealIds,
      };
}
