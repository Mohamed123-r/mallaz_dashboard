abstract class AddAdminRepo {
  Future<Map<String, dynamic>> addAdmin({
    String fullName,
    String phoneNumber,
    String password,
    String confirmPassword,
  });
}
