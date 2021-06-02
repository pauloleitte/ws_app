import 'package:asuka/asuka.dart' as asuka;
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

  UserService service;
  UserStore store;

  _LoginControllerBase(this.service, this.store);

  @computed
  LoginViewModel get model => LoginViewModel(email: email, password: password);

  Future<void> login() async {
    try {
      busy = true;
      var result = await service.login(model);
      result.fold((failure) {
        asuka.showSnackBar(SnackBar(content: Text('Usuário ou senha inválidos!')));
      }, (user) {
        store.setUser(user);
        Modular.to.navigate(AppRoutes.HOME);
      });
    } catch (e) {
      busy = false;
      asuka.showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      busy = false;
    }
  }
}
