class Deal {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String type; // e.g., "Food", "Drink", "Dessert"
  final DateTime validUntil;
  final String restaurantId;
  final double? originalPrice;
  final double? discountedPrice;
  final bool isFeatured;

  const Deal({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.type,
    required this.validUntil,
    required this.restaurantId,
    this.originalPrice,
    this.discountedPrice,
    this.isFeatured = false,
  });
  Deal copyWith({
  String? id,
  String? title,
  String? description,
  String? imageUrl,
  String? type,
  DateTime? validUntil,
  String? restaurantId,
  double? originalPrice,
  double? discountedPrice,
  bool? isFeatured,
}) {
  return Deal(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    imageUrl: imageUrl ?? this.imageUrl,
    type: type ?? this.type,
    validUntil: validUntil ?? this.validUntil,
    restaurantId: restaurantId ?? this.restaurantId,
    originalPrice: originalPrice ?? this.originalPrice,
    discountedPrice: discountedPrice ?? this.discountedPrice,
    isFeatured: isFeatured ?? this.isFeatured,
  );
}
}

