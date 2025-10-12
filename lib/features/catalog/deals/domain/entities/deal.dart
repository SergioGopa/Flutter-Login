class Deal {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String type; // Food, Drinks, Dessert, etc.
  final DateTime validFrom;
  final DateTime validUntil;

  final String restaurantId;
  final String restaurantName;
  final double originalPrice;
  final double discountedPrice;

  // Categorization / Filtering
  final bool isFeatured; // carousel
  final bool isPopular; // popular deals
  final bool isUpcoming; // validFrom in the future
  final List<String> categories; // for category filter e.g. ["Mexican", "2x1"]
  final List<String> tags;

  // Ratings & Reviews
  final double rating; // average rating
  final int reviewsCount; // number of reviews

  //Filter related fields
  final List<String> validDaysOfWeek;
  final List<Map<String, String>> timeWindows;
  final double minOrderAmount;
  final bool dineInOnly;
  final bool delivery;
  final bool takeout;
  final bool adultsOnly;
  final bool petFriendly;

  Deal({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.type,
    required this.validFrom,
    required this.validUntil,
    required this.restaurantId,
    required this.restaurantName,
    required this.originalPrice,
    required this.discountedPrice,
    this.isFeatured = false,
    this.isPopular = false,
    this.isUpcoming = false,
    this.categories = const [],
    this.tags = const [],
    this.rating = 0.0,
    this.reviewsCount = 0,
    this.validDaysOfWeek = const [],
    this.timeWindows = const [],
    this.minOrderAmount = 0.0,
    this.dineInOnly = false,
    this.delivery = false,
    this.takeout = false,
    this.adultsOnly = false,
    this.petFriendly = false
  });

  Deal copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    String? type,
    DateTime? validFrom,
    DateTime? validUntil,
    String? restaurantId,
    String? restaurantName,
    double? originalPrice,
    double? discountedPrice,
    bool? isFeatured,
    bool? isPopular,
    bool? isUpcoming,
    List<String>? categories,
    List<String>? tags,
    double? rating,
    int? reviewsCount,
    List<String>? validDaysOfWeek,
    List<Map<String, String>>? timeWindows,
    double? minOrderAmount,
    bool? dineInOnly,
    bool? delivery,
    bool? takeout,
    bool? adultsOnly,
    bool? petFriendly,
  }) {
    return Deal(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      type: type ?? this.type,
      validFrom: validFrom ?? this.validFrom,
      validUntil: validUntil ?? this.validUntil,
      restaurantId: restaurantId ?? this.restaurantId,
      restaurantName: restaurantName ?? this.restaurantName,
      originalPrice: originalPrice ?? this.originalPrice,
      discountedPrice: discountedPrice ?? this.discountedPrice,
      isFeatured: isFeatured ?? this.isFeatured,
      isPopular: isPopular ?? this.isPopular,
      isUpcoming: isUpcoming ?? this.isUpcoming,
      categories: categories ?? this.categories,
      tags: tags ?? this.tags,
      rating: rating ?? this.rating,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      validDaysOfWeek: validDaysOfWeek ?? this.validDaysOfWeek,
      timeWindows: timeWindows ?? this.timeWindows,
      minOrderAmount: minOrderAmount ?? this.minOrderAmount,
      dineInOnly: dineInOnly ?? this.dineInOnly,
      delivery: delivery ?? this.delivery,
      takeout: takeout ?? this.takeout,
      adultsOnly: adultsOnly ?? this.adultsOnly,
      petFriendly: petFriendly ?? this.petFriendly,
    );
  }
}
