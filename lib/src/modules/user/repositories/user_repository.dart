import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:ws_app/src/modules/user/models/forgot_password_request_model.dart';
import 'package:ws_app/src/modules/user/models/image_model.dart';
import 'package:ws_app/src/modules/user/models/login_request_model.dart';
import 'package:ws_app/src/modules/user/models/reset_password_request_model.dart';
import 'package:ws_app/src/modules/user/models/signup_request_model.dart';
import 'package:ws_app/src/modules/user/models/user_create_model.dart';
import 'package:ws_app/src/shared/errors/errors.dart';

import '../models/user_model.dart';
import 'interfaces/user_repository_interface.dart';

class UserRepository implements IUserRepository {
  final DioForNative _client;

  UserRepository(this._client);

  @override
  void dispose() {}

  @override
  Future<Either<Failure, UserModel>> login(LoginRequestModel model) async {
    try {
      var response = await _client.post('/login', data: model.toJson());
      if (response.statusCode == HttpStatus.ok) {
        var result = UserModel.fromJson(response.data);
        return Right(result);
      }
      return Left(DioFailure(
          message: 'Usuário ou senha inválidos',
          statusCode: response.statusCode));
    } on DioError catch (err) {
      return Left(DioFailure(
          message: err.response!.data[0].message,
          statusCode: err.response!.statusCode));
    }
  }

  @override
  Future<Either<Failure, UserCreateModel>> signup(
      SignupRequestModel model) async {
    try {
      var response = await _client.post('/signup', data: model.toJson());
      if (response.statusCode == HttpStatus.created) {
        return Right(UserCreateModel.fromJson(response.data));
      }
      return Left(DioFailure(
          message: 'Ocorreu um erro por favor tente novamente',
          statusCode: response.statusCode));
    } on DioError catch (err) {
      return Left(DioFailure(
          message: err.response!.data, statusCode: err.response!.statusCode));
    }
  }

  @override
  Future<Either<Failure, bool>> forgotPassoword(
      ForgotPasswordRequestModel model) async {
    try {
      var response =
          await _client.post('/forgot-password', data: model.toJson());
      if (response.statusCode == HttpStatus.noContent) {
        return Right(true);
      }
      return Left(DioFailure(
          message: 'Ocorreu um erro por favor tente novamente',
          statusCode: response.statusCode));
    } on DioError catch (err) {
      return Left(DioFailure(
          message: err.response!.data, statusCode: err.response!.statusCode));
    }
  }

  @override
  Future<Either<Failure, bool>> resetPassword(
      ResetPasswordRequestModel model) async {
    try {
      var response = await _client.post('reset-password', data: model.toJson());
      await _client.post('/forgot-password', data: model.toJson());
      if (response.statusCode == HttpStatus.noContent) {
        return Right(true);
      }
      return Left(DioFailure(
          message: 'Ocorreu um erro por favor tente novamente',
          statusCode: response.statusCode));
    } on DioError catch (err) {
      return Left(DioFailure(
          message: err.response!.data, statusCode: err.response!.statusCode));
    }
  }

  @override
  Future<Either<Failure, ImageModel>> uploadImage(
      File file, String? userId) async {
    try {
      String fileName = file.path.split('/').last;
      FormData data = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
      });
      final Map<String, dynamic> headers = new Map<String, dynamic>();
      headers['userId'] = userId;
      var response = await _client.post('/images',
          data: data, options: Options(headers: headers));
      if (response.statusCode == HttpStatus.ok) {
        return Right(ImageModel.fromJson(response.data));
      }
      return Left(DioFailure(
          message: 'Ocorreu um erro por favor tente novamente',
          statusCode: response.statusCode));
    } on DioError catch (err) {
      return Left(DioFailure(
          message: err.response!.data, statusCode: err.response!.statusCode));
    }
  }
}
