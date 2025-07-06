import '../models/admin_model.dart';

abstract class AdminRepo {
  Future<Map<String ,dynamic>> getAllAdmins();
}