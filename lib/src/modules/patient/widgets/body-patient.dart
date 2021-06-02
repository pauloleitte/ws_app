import 'package:flutter/material.dart';
import 'package:ws_app/src/modules/patient/widgets/patient-item.dart';

class BodyPatient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final patients = [];
    return ListView.builder(
      itemCount: patients.length,
      itemBuilder: (ctx, i) => Column(
        children: <Widget>[
          PatientItem(patients[i]),
          Divider(),
        ],
      ),
    );
  }
}
