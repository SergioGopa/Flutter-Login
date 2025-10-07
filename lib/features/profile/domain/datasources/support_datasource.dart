abstract class SupportDatasource {
  Future<void> sendSupportMessage({required String userId, required String subject, required String message});
}