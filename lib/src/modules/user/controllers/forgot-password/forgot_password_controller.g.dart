// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forgot_password_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ForgotPasswordController on _ForgotPasswordControllerBase, Store {
  Computed<bool>? _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_ForgotPasswordControllerBase.isValid'))
      .value;
  Computed<ForgotPasswordViewModel>? _$modelComputed;

  @override
  ForgotPasswordViewModel get model =>
      (_$modelComputed ??= Computed<ForgotPasswordViewModel>(() => super.model,
              name: '_ForgotPasswordControllerBase.model'))
          .value;

  final _$emailAtom = Atom(name: '_ForgotPasswordControllerBase.email');

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$busyAtom = Atom(name: '_ForgotPasswordControllerBase.busy');

  @override
  bool get busy {
    _$busyAtom.reportRead();
    return super.busy;
  }

  @override
  set busy(bool value) {
    _$busyAtom.reportWrite(value, super.busy, () {
      super.busy = value;
    });
  }

  @override
  String toString() {
    return '''
email: ${email},
busy: ${busy},
isValid: ${isValid},
model: ${model}
    ''';
  }
}
