import 'package:dio/dio.dart';
import 'package:eisty/features/shared/infrastructure/services/secure_storage_service.dart';

import 'package:eisty/config/config.dart';
import 'package:eisty/features/auth/auth.dart';
import 'package:eisty/features/profile/domain/datasources/profile_datasource.dart';
import 'package:eisty/features/shared/domain/entities/user.dart';
import 'package:eisty/features/shared/infrastructure/mappers/user_mapper.dart';

class ProfileDatasourceImpl extends ProfileDatasource {
  final Dio dio;
  // final FlutterSecureStorage secureStorage;
  final SecureStorageService secureStorageService;

  ProfileDatasourceImpl(this.secureStorageService)
      : dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  Future<String?> _getToken() async {
    return await secureStorageService.getToken();
  }

  @override
  Future<String> changePassword(
      String id, String currentPassword, String newPassword) async {
    final token = await _getToken();

    try {
      final response = await dio.patch('/users/$id/password',
          data: {
            'currentPassword': currentPassword,
            'newPassword': newPassword
          },
          options: Options(
              headers: {'Content-Type': 'application/json', 'x-token': token}));
      return response.data['msg'] ?? "Password updated";
    } on DioException catch (e) {
      throw CustomError(e.response?.data['msg'] ?? 'Password change failed');
    }
  }

  @override
  Future<void> deleteAccount(String id) async {
    final token = await _getToken();

    try {
      await dio.delete('/users/$id',
          options: Options(
              headers: {'Content-Type': 'application/json', 'x-token': token}));
    } on DioException catch (e) {
      throw CustomError(e.response?.data['msg'] ?? 'Delete failed');
    }
  }

  @override
  Future<User> getUserById(String id) async {
    final token = await _getToken();
    try {
      final response = await dio.get(
        '/users/$id',
        options: Options(
          headers: {'Content-Type': 'application/json', 'x-token': token},
        ),
      );
      return UserMapper.userJsonToEntity(response.data['user']);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw CustomError(e.response?.data['msg'] ?? 'Invalid user ID');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Check your internet connection');
      }
      throw Exception();
    }
  }

  @override
  Future<User> updateUser(String id, Map<String, dynamic> payload) async {
    final token = await _getToken();
    final fullUrl = '${dio.options.baseUrl}/users/$id';
    print('Token being sent: $token');
    print('Calling PUT $fullUrl with payload: $payload');

    try {
      final response = await dio.put(
        '/users/$id',
        data: payload,
        options: Options(
            headers: {'Content-Type': 'application/json', 'x-token': token}),
      );
      return UserMapper.userJsonToEntity(response.data['user']);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw CustomError(e.response?.data['msg'] ?? 'Update failed');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Check your internet Connection');
      }
      throw Exception();
    }
  }
}
