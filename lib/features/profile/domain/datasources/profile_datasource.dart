import 'package:eisty/features/shared/domain/domain.dart';

abstract class ProfileDatasource {
  Future<User> getUserById(String id);
  
  Future<User> updateUser(String id, Map<String, dynamic> payload);
  
  Future<String> changePassword(String id,String currentPassword , String newPassword);

  Future<void> deleteAccount(String id);
}
