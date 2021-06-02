import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_app/src/modules/user/controllers/forgot-password/forgot_password_controller.dart';
import 'package:ws_app/src/modules/user/controllers/login/login_controller.dart';
import 'package:ws_app/src/modules/user/controllers/reset-password/reset_password_controller.dart';
import 'package:ws_app/src/modules/user/controllers/signup/signup_controller.dart';
import 'package:ws_app/src/modules/user/pages/forgot_password_page.dart';
import 'package:ws_app/src/modules/user/pages/login_page.dart';
import 'package:ws_app/src/modules/user/pages/reset_password_page.dart';
import 'package:ws_app/src/modules/user/pages/signup.page.dart';
import 'package:ws_app/src/modules/user/repositories/user_repository.dart';
import 'package:ws_app/src/modules/user/services/user_service.dart';

class UserModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => UserService(i.get())),
    Bind.factory((i) => UserRepository(i.get())),
    Bind.factory((i) => LoginController(i.get(), i.get())),
    Bind.factory((i) => SignupController(i.get())),
    Bind.factory((i) => ForgotPasswordController(i.get())),
    Bind.factory((i) => ResetPasswordController(i.get()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LoginPage()),
    ChildRoute('/signup', child: (_, args) => SignupPage()),
    ChildRoute('/forgot-password', child: (_, args) => ForgotPasswordPage()),
    ChildRoute('/reset-password', child: (_, args) => ResetPasswordPage()),
    ChildRoute('/login', child: (_, args) => LoginPage())
  ];
}
