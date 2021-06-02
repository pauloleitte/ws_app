import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_app/src/core/app_constants.dart';
import 'package:ws_app/src/core/app_routes.dart';
import 'package:ws_app/src/modules/user/stores/user_store.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Modular.get<UserStore>();
    return Observer(builder: (_) {
      return Drawer(
        child: Container(
          color: kPrimaryColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text(store.user.name as String),
                accountEmail: Text(store.user.email as String),
                currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: Image.network(
                   store.user.avatar!,
                    height: 150.0,
                    width: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: kSecondaryColor,
                ),
                title: Text('Home'),
                subtitle: Text('tela inicial'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.people, color: kSecondaryColor),
                title: Text('Pacientes'),
                subtitle: Text('pacientes'),
                onTap: () {
                  Modular.to.navigate(AppRoutes.PATIENTS);
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
