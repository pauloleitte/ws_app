import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:ws_app/src/modules/user/models/forgot_password_request_model.dart';
import 'package:ws_app/src/modules/user/models/login_request_model.dart';
import 'package:ws_app/src/modules/user/models/reset_password_request_model.dart';
import 'package:ws_app/src/modules/user/models/signup_request_model.dart';
import 'package:ws_app/src/shared/errors/errors.dart';

import '../models/user_model.dart';
import 'interfaces/user_repository_interface.dart';

class UserRepository implements IUserRepository {
  final DioForNative _client;

  UserRepository(this._client);

  @override
  void dispose() {}

  @override
  Future<UserModel> login(LoginRequestModel model) async {
    try {
      var response = await _client.post('/login', data: model.toJson());
      if (response.statusCode == HttpStatus.ok) {
        var result = UserModel.fromJson(response.data);
        return result;
      }
      return UserModel();
    } on DioError catch (err) {
      throw DioFailure(
          message: err.response!.data, statusCode: err.response!.statusCode);
    }
  }

  @override
  Future<bool> signup(SignupRequestModel model) async {
    try {
      var response = await _client.post('/signup', data: model.toJson());
      if (response.statusCode == HttpStatus.created) {
        return true;
      }
      return false;
    } on DioError catch (err) {
      throw DioFailure(
          message: err.response!.data, statusCode: err.response!.statusCode);
    }
  }

  @override
  Future<bool> forgotPassoword(ForgotPasswordRequestModel model) async {
    try {
      var response =
          await _client.post('/forgot-password', data: model.toJson());
      if (response.statusCode == HttpStatus.noContent) {
        return true;
      }
      return false;
    } on DioError catch (err) {
      throw DioFailure(
          message: err.response!.data, statusCode: err.response!.statusCode);
    }
  }

  @override
  Future<bool> resetPassword(ResetPasswordRequestModel model) async {
    try {
      var response = await _client.post('reset-password', data: model.toJson());
      if (response.statusCode == HttpStatus.noContent) {
        return true;
      }
      return false;
    } on DioError catch (err) {
      throw DioFailure(
          message: err.response!.data, statusCode: err.response!.statusCode);
    }
  }
}
