
import 'package:eisty/features/profile/domain/datasources/profile_datasource.dart';
import 'package:eisty/features/profile/domain/repositories/profile_repository.dart';
import 'package:eisty/features/profile/infrastructure/datasources/profile_datasource_impl.dart';
import 'package:eisty/features/shared/domain/entities/user.dart';
import 'package:eisty/features/shared/infrastructure/services/secure_storage_service.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  final ProfileDatasource datasource;

  ProfileRepositoryImpl({
    required SecureStorageService secureStorageService,
    ProfileDatasource? datasource,
    }): datasource = datasource ?? ProfileDatasourceImpl(secureStorageService);

  @override
  Future<String> changePassword(String id, String currentPassword, String newPassword) {
    return datasource.changePassword(id, currentPassword, newPassword);
  }

  @override
  Future<void> deleteAccount(String id) {
    return datasource.deleteAccount(id);
  }

  @override
  Future<User> getUserById(String id) {
    return datasource.getUserById(id);
  }

  @override
  Future<User> updateUser(User user) async {
    final payload = {
      if (user.name.isNotEmpty) 'name': user.name,
      if (user.email.isNotEmpty) 'email': user.email,
    };
    
    print('Payload to backend: $payload');
    
    if (user.email.isNotEmpty) {
      payload['email'] = user.email;
    }

    return datasource.updateUser(user.id, payload);
  }
}
