import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:ws_app/src/core/app_routes.dart';
import 'package:ws_app/src/modules/user/services/user_service.dart';
import 'package:ws_app/src/modules/user/stores/user_store.dart';
import 'package:ws_app/src/modules/user/view-models/login_view_model.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {

  @observable
  String? email;
  @observable
  String? password;

  @observable
  bool busy = false;

  @observable
  bool error = false;

  UserService service;
  UserStore store;

  _LoginControllerBase(this.service, this.store);

  @computed
  LoginViewModel get model => LoginViewModel(email: email, password: password);

  @computed
  bool get isValid => model.isValidEmail && model.isValidPassword;

  Future<void> login() async {
    try {
      busy = true;
      await Future.delayed(Duration(seconds: 1));
      var user = await service.login(model);
      store.setUser(user);
      Modular.to.navigate(AppRoutes.HOME);
    } catch (e) {
      busy = false;
      error = true;
      debugPrint(e.toString());
    }
  }
}
