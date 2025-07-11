class User {
  final String id;
  final String email;
  final String name;
  final String role;
  final bool online;
  

  User(
      {required this.id,
      required this.email,
      required this.name,
      required this.role,
      required this.online});

  bool get isAdmin {
    return role.contains('admin');
  }
}
