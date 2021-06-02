import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_app/src/modules/user/view-models/forgot_password_view_model.dart';
import 'package:ws_app/src/modules/user/view-models/login_view_model.dart';
import 'package:ws_app/src/modules/user/view-models/reset_password_view_model.dart';
import 'package:ws_app/src/modules/user/view-models/signup_view_model.dart';
import '../../models/user_model.dart';

abstract class IUserService implements Disposable {
  Future<UserModel> getCurrentUser();
  Future<void> saveLocalDB(UserModel user);
  Future<UserModel> login(LoginViewModel login);
  Future<bool> signup(SignupViewModel signup);
  Future<bool> forgotPassword(ForgotPasswordViewModel forgotPassword);
  Future<bool> resetPassword(ResetPasswordViewModel resetPassword);
}
