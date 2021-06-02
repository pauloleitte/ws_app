import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_app/src/modules/user/models/forgot_password_request_model.dart';
import 'package:ws_app/src/modules/user/models/login_request_model.dart';
import 'package:ws_app/src/modules/user/models/reset_password_request_model.dart';
import 'package:ws_app/src/modules/user/models/signup_request_model.dart';

import '../../models/user_model.dart';

abstract class IUserRepository implements Disposable {
  Future<UserModel> login(LoginRequestModel model);
  Future<bool> signup(SignupRequestModel model);
  Future<bool> forgotPassoword(ForgotPasswordRequestModel model);
  Future<bool> resetPassword(ResetPasswordRequestModel model);
}
