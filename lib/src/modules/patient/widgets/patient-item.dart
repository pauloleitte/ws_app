import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ws_app/src/core/app_constants.dart';
import 'package:ws_app/src/core/app_routes.dart';
import 'package:ws_app/src/modules/patient/models/patient.dart';

class PatientItem extends StatelessWidget {
  final Patient patient;

  PatientItem(this.patient);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: kPrimaryColor,
      child: ListTile(
        title: Text(
          patient.name!,
          style: TextStyle(color: Colors.white),
        ),
        onLongPress: () {
          final action = CupertinoActionSheet(
            title: Text(
              patient.name!,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            message: Text(
              "O que deseja fazer?",
              style: TextStyle(fontSize: 18.0),
            ),
            actions: <Widget>[
              CupertinoActionSheetAction(
                child: Text(
                  "Editar",
                  style: TextStyle(color: Colors.blue),
                ),
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.of(context)
                      .pushNamed(AppRoutes.PATIENT_FORM, arguments: patient);
                },
              ),
              CupertinoActionSheetAction(
                child: Text(
                  "Excluir",
                  style: TextStyle(color: Theme.of(context).errorColor),
                ),
                isDestructiveAction: true,
                onPressed: () {
                  print("Action 2 is been clicked");
                  Navigator.pop(context);
                },
              )
            ],
            cancelButton: CupertinoActionSheetAction(
              child: Text(
                "Cancelar",
                style: TextStyle(color: Colors.lightBlue),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          );
          showCupertinoModalPopup(
              context: context, builder: (context) => action);
        },
        subtitle: Text(
          '${patient.cpf}',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
