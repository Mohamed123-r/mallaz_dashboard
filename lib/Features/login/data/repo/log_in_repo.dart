
import '../models/log_in_model.dart';

abstract class LoginRepo {
  Future<LoginModel> login(String phoneNumber, String password);
}