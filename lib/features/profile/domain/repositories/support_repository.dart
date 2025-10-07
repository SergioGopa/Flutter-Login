abstract class SupportRepository {
  Future<void> sendSupportMessage({required String userId, required String subject, required String message});
}