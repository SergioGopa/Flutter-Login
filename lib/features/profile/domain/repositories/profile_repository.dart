import 'package:eisty/features/shared/domain/domain.dart';

abstract class ProfileRepository {
  Future<User> getUserById(String id);
  
  Future<User> updateUser(User user);
  
  Future<String> changePassword(String id,String currentPassword, String newPassword);

  Future<void> deleteAccount(String id);
}