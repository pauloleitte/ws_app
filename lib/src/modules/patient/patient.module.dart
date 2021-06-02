import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_app/src/core/app_routes.dart';
import 'package:ws_app/src/modules/patient/pages/patient-form-page.dart';
import 'package:ws_app/src/modules/patient/pages/patient-page.dart';

class PatientModule extends Module {
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => PatientPage()),
    ChildRoute(AppRoutes.PATIENT_FORM, child: (_, args) => PatientFormPage())
  ];
}
