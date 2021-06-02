import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ws_app/src/core/app_routes.dart';
import 'package:ws_app/src/modules/user/services/user_service.dart';
import 'package:ws_app/src/modules/user/view-models/reset_password_view_model.dart';
part 'reset_password_controller.g.dart';

class ResetPasswordController = _ResetPasswordControllerBase
    with _$ResetPasswordController;

abstract class _ResetPasswordControllerBase with Store {
  @observable
  String? token;

  @observable
  String? email;

  @observable
  String? password;

  @observable
  String? confirmPassword;

  UserService service;

  _ResetPasswordControllerBase(this.service);

  @computed
  ResetPasswordViewModel get model => ResetPasswordViewModel(
      email: this.email,
      password: this.password,
      token: this.token,
      confirmPassword: this.confirmPassword);

  @computed
  bool get isValid => model.isValidPassword && model.isValidConfirmPassword;

  Future<void> resetPassword() async {
    try {
      var result = await service.resetPassword(model);
      result.fold((failure) {
        asuka.showSnackBar(SnackBar(
            content:
                Text('Não foi possível enviar o e-mail tente novamente!')));
      }, (value) => Modular.to.navigate(AppRoutes.AUTH_HOME));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
