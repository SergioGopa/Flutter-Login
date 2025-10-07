import 'package:dio/dio.dart';
import 'package:eisty/config/config.dart';
import 'package:eisty/features/auth/auth.dart';
import 'package:eisty/features/profile/domain/domain.dart';
import 'package:eisty/features/shared/infrastructure/services/secure_storage_service.dart';

class SupportDatasourceImpl extends SupportDatasource {
  final Dio dio;
  final SecureStorageService secureStorageService;

  SupportDatasourceImpl(this.secureStorageService)
      : dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  Future<String?> _getToken() async {
    return await secureStorageService.getToken();
  }

  @override
  Future<void> sendSupportMessage(
      {required String userId,
      required String subject,
      required String message}) async {
    final token = await _getToken();

    try {
      await dio.post(
        '/support',
        data: {
          'userId': userId,
          'subject': subject,
          'message': message,
        },
        options: Options(
          headers: {'Content-Type': 'application/json', 'x-token': token},
        ),
      );
    } on DioException catch (e) {
      throw CustomError(e.response?.data['msg'] ?? 'Failed to send message');
    }
  }
}
