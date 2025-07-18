class Restaurant {
  final String id;
  final String name;
  final String imageUrl;
  final String address;
  final double rating;
  final List<String> categories; // e.g., ["Mexican", "Tacos"]
  final bool isOpen;

  const Restaurant({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.address,
    required this.rating,
    required this.categories,
    required this.isOpen,
  });
}