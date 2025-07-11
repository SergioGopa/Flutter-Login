import 'package:eisty/features/auth/domain/domain.dart';

class UserMapper {
  static User userJsonToEntity(Map<String, dynamic> json) => User(
      id: json['uid']??'',
      email: json['email']??'',
      name: json['name']??'',
      role: json['role']??'user',
      online: json['online']??false);
}
