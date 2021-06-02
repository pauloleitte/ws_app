import 'package:flutter/material.dart';
import 'package:ws_app/src/core/app_constants.dart';
import 'package:ws_app/src/core/app_routes.dart';
import 'package:ws_app/src/modules/home/widgets/body-home.dart';
import 'package:ws_app/src/modules/home/widgets/drawer-home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text("Home"),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app_sharp),
              onPressed: () {
                Navigator.popAndPushNamed(context, AppRoutes.AUTH_HOME);
              },
            )
          ]),
      body: BodyHome(),
      drawer: DrawerHome(),
    );
  }
}
