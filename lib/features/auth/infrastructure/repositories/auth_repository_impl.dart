import 'package:eisty/features/auth/domain/domain.dart';
import 'package:eisty/features/auth/infrastructure/infrastructure.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthDatasource dataSource;

  AuthRepositoryImpl({AuthDatasource? dataSource})
      : dataSource = dataSource ?? AuthDatasourceImpl();

  @override
  Future<LoginResponse> checkAuthStatus(String token) {
    return dataSource.checkAuthStatus(token);
  }

  @override
  Future<LoginResponse> login(String email, String password) {
    return dataSource.login(email, password);
  }

  @override
  Future<LoginResponse> register(String email, String password, String fullName) {
    return dataSource.register(email, password, fullName);
  }
}
