import 'package:flutter/material.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter_modular/flutter_modular.dart';

import 'core/app_theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WS APP',
      debugShowCheckedModeBanner: false,
      theme: theme(),
      navigatorObservers: [
        asuka.asukaHeroController //if u don`t add this Hero will not work
      ],
      builder: asuka.builder,
    ).modular();
  }
}
