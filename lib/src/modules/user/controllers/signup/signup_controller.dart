import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ws_app/src/core/app_routes.dart';
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
      await Future.delayed(Duration(seconds: 1));
      var result = await service.signup(model);
      if (result) {
        Modular.to.navigate(AppRoutes.AUTH_HOME);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
