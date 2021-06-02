import 'package:flutter/material.dart';
import 'package:ws_app/src/core/app_constants.dart';
import 'package:ws_app/src/core/app_images.dart';

class BodyHome extends StatelessWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: kPrimaryColor,
        child: Center(
          child: Image.asset(
            AppImages.logo,
          ),
        ));
  }
}
