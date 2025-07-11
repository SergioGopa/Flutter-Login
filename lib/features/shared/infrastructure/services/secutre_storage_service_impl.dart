import 'package:eisty/features/shared/infrastructure/services/secure_storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecutreStorageServiceImpl extends SecureStorageService {
  final _storage = const FlutterSecureStorage();

  static const _tokenKey = 'token';

  @override
  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

  @override
  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  @override
  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }
}
