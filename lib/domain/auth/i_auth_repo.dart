import 'package:clean_api/clean_api.dart';

import 'login_body.dart';
import 'model/signup_responce.dart';
import 'signup_body.dart';

abstract class IAuthRepo {
  Future<Either<CleanFailure, AuthResponse>> login(LoginBody body);
  Future<Either<CleanFailure, AuthResponse>> signUp(SignupBody body);
  // Future<Option<UserModel>> getUserData();
  // Future<void> logout();
}
