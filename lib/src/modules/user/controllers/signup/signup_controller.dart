import 'dart:io';

import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ws_app/src/core/app_routes.dart';
import 'package:ws_app/src/modules/user/models/user_create_model.dart';
import 'package:ws_app/src/modules/user/services/user_service.dart';
import 'package:ws_app/src/modules/user/view-models/signup_view_model.dart';
part 'signup_controller.g.dart';

class SignupController = _SignupControllerBase with _$SignupController;

abstract class _SignupControllerBase with Store {
  @observable
  String? name;

  @observable
  String? email;

  @observable
  String? password;

  @observable
  String? confirmPassword;

  @observable
  bool busy = false;

  @observable
  File? file;

  @observable
  UserCreateModel? userCreateModel;

  @computed
  File? get fileUpload => file;

  UserService service;

  _SignupControllerBase(this.service);

  @computed
  bool get isValid =>
      model.isValidEmail &&
      model.isValidPassword &&
      model.isValidName &&
      model.isValidConfirmPassword;

  @computed
  bool get isValidEmail => model.isValidEmail;

  @computed
  SignupViewModel get model => SignupViewModel(
      email: email,
      password: password,
      name: name,
      confirmPassword: confirmPassword);

  Future<void> signup() async {
    try {
      busy = true;
      var result = await service.signup(model);
      result.fold((l) {
        asuka.showSnackBar(SnackBar(
            content: Text(
                'Não foi possível realizar o cadastro, por favor tente novamente')));
      }, (userCreateModel) async {
        this.userCreateModel = userCreateModel;
        await uploadImage();
      });
    } catch (e) {
      busy = false;
      asuka.showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      busy = false;
    }
  }

  Future<void> uploadImage() async {
    try {
      busy = true;
      var result = await service.uploadImage(fileUpload!, userCreateModel!.sId);
      result.fold(
          (l) => asuka.showSnackBar(SnackBar(
              content: Text(
                  'Não foi possível realizar o cadastro, por favor tente novamente'))),
          (r) {
        Modular.to.navigate(AppRoutes.AUTH_HOME);
        print(r.url);
      });
    } catch (e) {
      busy = false;
      asuka.showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      busy = false;
    }
  }
}
