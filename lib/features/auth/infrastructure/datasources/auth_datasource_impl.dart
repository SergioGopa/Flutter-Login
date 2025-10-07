import 'package:dio/dio.dart';
import 'package:eisty/config/config.dart';
import 'package:eisty/features/auth/domain/domain.dart';
import 'package:eisty/features/auth/infrastructure/infrastructure.dart';
import 'package:eisty/features/shared/infrastructure/infrastructure.dart';

class AuthDatasourceImpl extends AuthDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: Environment.apiUrl,
  ));

  @override
  Future<LoginResponse> checkAuthStatus(String token) async {
    try {
      final response = await dio.get('/renew',
          options: Options(headers: {
            'Content-Type': 'application/json',
            'x-token': token!
          }));
      final userJson = response.data['user'];

      final user = UserMapper.userJsonToEntity(userJson);

      return LoginResponse(token: token, user: user);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        throw CustomError('Token incorrento');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Revisar conexion a Internet');
      }

      throw Exception();
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<LoginResponse> login(String email, String password) async {
    try {
      print('Calling: ${dio.options.baseUrl}/signin');
      final response = await dio.post('/signin',
          data: {
            'email': email,
            'password': password,
          },
          options: Options(
            headers: {'Content-Type': 'application/json'},
            // validateStatus: (status) => true,
          ));
      print('📡 Response ${response.statusCode}: ${response.data}');
      final token = response.data['token'] ?? '';
      final user = UserMapper.userJsonToEntity(response.data['user']);

      return LoginResponse(user: user, token: token);
    } on DioException catch (e) {
      print('❌ DioException type: ${e.type}');
      print('❌ DioException message: ${e.message}');
      if (e.response != null) {
        print('❌ Dio response data: ${e.response?.data}');
        print('❌ Dio response status: ${e.response?.statusCode}');
      }
      if (e.response?.statusCode == 400) {
        throw CustomError(
            e.response?.data['message'] ?? 'Credenciales incorrectas');
      }
      if (e.type == DioExceptionType.connectionTimeout) {
        throw CustomError('Revisar conexion a Internet');
      } else {
        print('❌ No response received from server');
      }

      throw Exception();
    } catch (e) {
      print('❌ errrrooooor ${ e.toString()}');
      throw Exception();
    }
  }

  @override
  Future<LoginResponse> register(
      String email, String password, String fullName) async {
    try {
      print('Calling: ${dio.options.baseUrl}/signup');
      final response = await dio.post('/signup',
          data: {
            'email': email,
            'password': password,
            'name': fullName,
          },
          options: Options(headers: {'Content-Type': 'application/json'}));
      print('📡 Response ${response.statusCode}: ${response.data}');
      final user = UserMapper.userJsonToEntity(response.data['user']);
      final token = response.data['token'] ?? '';

      return LoginResponse(token: token, user: user);
    } catch (e) {
      throw Exception();
    }
  }
}
