import 'package:flutter/material.dart';
import 'package:ws_app/src/core/app_constants.dart';
import 'package:ws_app/src/core/app_routes.dart';
import 'package:ws_app/src/modules/patient/widgets/body-patient.dart';

class PatientPage extends StatelessWidget {
  const PatientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("Pacientes"),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.PATIENT_FORM);
            },
          ),
        ],
      ),
      body: BodyPatient(),
    );
  }
}
