import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:ws_app/src/core/app_constants.dart';
import 'package:ws_app/src/modules/user/controllers/forgot-password/forgot_password_controller.dart';

class BodyForgotPassword extends StatefulWidget {
  BodyForgotPassword({Key? key}) : super(key: key);

  @override
  _BodyForgotPasswordState createState() => _BodyForgotPasswordState();
}

class _BodyForgotPasswordState
    extends ModularState<BodyForgotPassword, ForgotPasswordController> {
  final _form = GlobalKey<FormState>();

  final _emailFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> forgotPassword() async {
    if (_form.currentState!.validate()) {
      _form.currentState!.save();
      controller.forgotPassword();
    }
  }

  Widget buildEmail() {
    return TextFormField(
        focusNode: _emailFocusNode,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            labelText: 'e-mail',
            border: OutlineInputBorder(),
            labelStyle: TextStyle(
                color: kSecondaryColor,
                fontWeight: _emailFocusNode.hasFocus
                    ? FontWeight.bold
                    : FontWeight.normal)),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return 'campo obrigatório';
          }
          return null;
        },
        onSaved: (value) {
          controller.email = value;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      color: kPrimaryColor,
      child: controller.busy
          ? Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                    ),
                    Text('Carregando')
                  ]),
            )
          : Padding(
              padding: EdgeInsets.all(10),
              child: SingleChildScrollView(
                child: Form(
                  key: _form,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Esqueci minha senha',
                          textAlign: TextAlign.start,
                          style: kTextStyleTitle,
                        ),
                        Text(
                          'Insira o e-mail associado à sua conta.',
                          style: kTextStyleSubTitle,
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        buildEmail(),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed:
                                  controller.isValid ? null : forgotPassword,
                              child: Text(
                                'Confirmar',
                                style: kTextStyleButtonAuth,
                              ),
                            ))
                      ]),
                ),
              )),
    );
  }
}
