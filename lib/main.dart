// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_app/src/app_module.dart';
import 'package:ws_app/src/app_widget.dart';

void main() => runApp(ModularApp(module: AppModule(), child: AppWidget()));