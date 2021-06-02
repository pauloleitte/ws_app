import 'dart:convert';

import 'package:ws_app/src/modules/user/models/forgot_password_request_model.dart';
import 'package:ws_app/src/modules/user/models/login_request_model.dart';
import 'package:ws_app/src/modules/user/models/reset_password_request_model.dart';
import 'package:ws_app/src/modules/user/models/signup_request_model.dart';
import 'package:ws_app/src/modules/user/view-models/forgot_password_view_model.dart';
import 'package:ws_app/src/modules/user/view-models/login_view_model.dart';
import 'package:ws_app/src/modules/user/view-models/reset_password_view_model.dart';
import 'package:ws_app/src/modules/user/view-models/signup_view_model.dart';
import 'package:ws_app/src/shared/services/local_storage_service.dart';
import '../models/user_model.dart';
import '../repositories/interfaces/user_repository_interface.dart';
import 'interfaces/user_service_interface.dart';

class UserService implements IUserService {
  final IUserRepository _userRepository;

  UserService(this._userRepository);
  //dispose will be called automatically
  @override
  void dispose() {}

  @override
  Future<UserModel> getCurrentUser() async {
    var contains = await LocalStorageService.cointains('current_user');
    if (contains) {
      var res = jsonDecode(
          await LocalStorageService.getValue<String>('current_user'));
      return UserModel.fromJson(res);
    } else {
      return UserModel();
    }
  }

  @override
  Future<void> saveLocalDB(UserModel user) async {
    LocalStorageService.setValue<String>(
        'current_user', jsonEncode(user.toJson()));
  }

  @override
  Future<UserModel> login(LoginViewModel model) async {
    var data = LoginRequestModel(email: model.email, password: model.password);
    var result = await _userRepository.login(data);

    return result;
  }

  @override
  Future<bool> signup(SignupViewModel model) async {
    var data = SignupRequestModel(
        name: model.name, email: model.email, password: model.password);
    return await _userRepository.signup(data);
  }

  @override
  Future<bool> forgotPassword(ForgotPasswordViewModel model) async {
    var data = ForgotPasswordRequestModel(email: model.email);
    return await _userRepository.forgotPassoword(data);
  }

  @override
  Future<bool> resetPassword(ResetPasswordViewModel model) async {
    var data = ResetPasswordRequestModel(
        token: model.token, password: model.password, email: model.email);
    return await _userRepository.resetPassword(data);
  }
}
