import 'package:eisty/features/auth/infrastructure/infrastructure.dart';

abstract class AuthDatasource {
  Future<LoginResponse> login(String email, String password);

  Future<LoginResponse> register(String email, String password, String fullName);

  Future<LoginResponse> checkAuthStatus(String token);
  
}
