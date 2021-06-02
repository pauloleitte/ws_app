import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ws_app/src/core/app_routes.dart';
import 'package:ws_app/src/modules/user/services/user_service.dart';
import 'package:ws_app/src/modules/user/view-models/forgot_password_view_model.dart';
part 'forgot_password_controller.g.dart';

class ForgotPasswordController = _ForgotPasswordControllerBase
    with _$ForgotPasswordController;

abstract class _ForgotPasswordControllerBase with Store {
  @observable
  String? email;

  @observable
  bool busy = false;

  UserService service;

  _ForgotPasswordControllerBase(this.service);

  @computed
  bool get isValid => model.isValidEmail;

  @computed
  ForgotPasswordViewModel get model => ForgotPasswordViewModel(email: email);

  Future<void> forgotPassword() async {
    try {
      busy = true;
      await Future.delayed(Duration(seconds: 1));
      var result = await service.forgotPassword(model);
      if (result) {
        Modular.to.navigate(AppRoutes.AUTH_RESET_PASSWORD);
      }
    } catch (e) {
      busy = false;
      debugPrint(e.toString());
    }
  }
}
