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
}