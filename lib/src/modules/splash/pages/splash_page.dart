import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_app/src/core/app_constants.dart';
import 'package:ws_app/src/core/app_images.dart';
import 'package:ws_app/src/core/app_routes.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then(
      (value) => Modular.to.navigate(AppRoutes.AUTH_HOME),
    );
    return Scaffold(
      body: Container(
        color: kPrimaryColor,
        child: Center(
          child: Image.asset(
            AppImages.logo,
          ),
        ),
      ),
    );
  }
}
