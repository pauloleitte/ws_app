import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_app/src/modules/user/models/image_model.dart';
import 'package:ws_app/src/modules/user/models/user_create_model.dart';
import 'package:ws_app/src/modules/user/view-models/forgot_password_view_model.dart';
import 'package:ws_app/src/modules/user/view-models/login_view_model.dart';
import 'package:ws_app/src/modules/user/view-models/reset_password_view_model.dart';
import 'package:ws_app/src/modules/user/view-models/signup_view_model.dart';
import 'package:ws_app/src/shared/errors/errors.dart';
import '../../models/user_model.dart';

abstract class IUserService implements Disposable {
  Future<UserModel> getCurrentUser();
  Future<void> saveLocalDB(UserModel user);
  Future<Either<Failure, UserModel>> login(LoginViewModel login);
   Future<Either<Failure, UserCreateModel>>  signup(SignupViewModel signup);
  Future<Either<Failure, bool>> forgotPassword(
      ForgotPasswordViewModel forgotPassword);
  Future<Either<Failure, bool>> resetPassword(
      ResetPasswordViewModel resetPassword);
  Future<Either<Failure, ImageModel>> uploadImage(File file, String? userId);
}
