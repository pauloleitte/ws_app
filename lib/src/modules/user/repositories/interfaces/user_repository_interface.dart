import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_app/src/modules/user/models/forgot_password_request_model.dart';
import 'package:ws_app/src/modules/user/models/image_model.dart';
import 'package:ws_app/src/modules/user/models/login_request_model.dart';
import 'package:ws_app/src/modules/user/models/reset_password_request_model.dart';
import 'package:ws_app/src/modules/user/models/signup_request_model.dart';
import 'package:ws_app/src/modules/user/models/user_create_model.dart';
import 'package:ws_app/src/shared/errors/errors.dart';

import '../../models/user_model.dart';

abstract class IUserRepository implements Disposable {
  Future<Either<Failure, UserModel>> login(LoginRequestModel model);
  Future<Either<Failure, UserCreateModel>> signup(SignupRequestModel model);
  Future<Either<Failure, bool>> forgotPassoword(
      ForgotPasswordRequestModel model);
  Future<Either<Failure, bool>> resetPassword(ResetPasswordRequestModel model);
  Future<Either<Failure, ImageModel>> uploadImage(File file, String? userId);
}
