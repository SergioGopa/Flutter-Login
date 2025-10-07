import 'package:eisty/features/profile/domain/domain.dart';

class SupportRepositoryImpl extends SupportRepository {
  final SupportDatasource datasource;

  SupportRepositoryImpl({required this.datasource});

  @override
  Future<void> sendSupportMessage(
      {required String userId,
      required String subject,
      required String message}) async {
    return datasource.sendSupportMessage(
        userId: userId, 
        subject: subject, 
        message: message
        );
  }
}
