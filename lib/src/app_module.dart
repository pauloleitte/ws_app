import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_app/src/modules/home/pages/home-page.dart';
import 'package:ws_app/src/modules/patient/patient.module.dart';
import 'package:ws_app/src/modules/splash/pages/splash_page.dart';
import 'package:ws_app/src/modules/user/repositories/user_repository.dart';
import 'package:ws_app/src/modules/user/services/user_service.dart';
import 'package:ws_app/src/modules/user/stores/user_store.dart';
import 'package:ws_app/src/modules/user/user_module.dart';

import 'core/app_routes.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => DioForNative(i.get())),
    Bind((i) => UserService(i.get())),
    Bind((i) => UserRepository(i.get())),
    Bind((i) => UserStore(i.get())),
    Bind(
      (i) => BaseOptions(
        baseUrl: 'http://192.168.0.48:3000/api/v1',
        connectTimeout: 5000,
      ),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(AppRoutes.AUTH_HOME, module: UserModule()),
    ModuleRoute(AppRoutes.PATIENTS, module: PatientModule()),
    ChildRoute(AppRoutes.SPLASH, child: (_, __) => SplashPage()),
    ChildRoute(AppRoutes.HOME, child: (_, __) => HomePage()),
  ];

}
