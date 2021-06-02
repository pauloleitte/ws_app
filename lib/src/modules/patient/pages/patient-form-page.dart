import 'package:flutter/material.dart';
import 'package:ws_app/src/core/app_constants.dart';
import 'package:ws_app/src/modules/patient/models/patient.dart';

class PatientFormPage extends StatefulWidget {
  PatientFormPage({Key? key}) : super(key: key);

  @override
  _PatientFormPageState createState() => _PatientFormPageState();
}

class _PatientFormPageState extends State<PatientFormPage> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  final _form = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

  final _nameFocusNode = FocusNode();
  final _naturalnessFocusNode = FocusNode();
  final _maritalStatusFocusNode = FocusNode();
  final _cpfFocusNode = FocusNode();
  final _rgFocusNode = FocusNode();
  final _birthDateFocusNode = FocusNode();
  final _genreFocusNode = FocusNode();
  final _professionFocusNode = FocusNode();

  final _emailFocusNode = FocusNode();
  final _cellphoneFocusNode = FocusNode();
  final _telephoneFocusNode = FocusNode();

  final _cepFocusNode = FocusNode();
  final _addressFocusNode = FocusNode();
  final _districtFocusNode = FocusNode();
  final _cityFocusNode = FocusNode();
  final _stateFocusNode = FocusNode();

  final defaultNumberKeyboard = TextInputType.numberWithOptions(decimal: true);
  bool _isLoading = false;

  Future<void> _saveForm() async {
    var isValid = _form.currentState!.validate();

    if (!isValid) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    _form.currentState!.save();

    final patient = Patient.fromJson(_formData);

    print(patient.name);
    Navigator.pop(context);
  }

  void _requestFocus(FocusNode focusNode) {
    setState(() {
      FocusScope.of(context).requestFocus(focusNode);
    });
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    if (_currentStep == 2) {
      _saveForm();
    }
    // ignore: unnecessary_statements
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    // ignore: unnecessary_statements
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_formData.isEmpty) {
      final patient = ModalRoute.of(context)!.settings.arguments as Patient;

      if (patient != null) {
        _formData['sId'] = patient.sId!;
        _formData['name'] = patient.name!;
        _formData['naturalness'] = patient.naturalness!;
        _formData['maritalStatus'] = patient.maritalStatus!;
        _formData['cpf'] = patient.cpf!;
        _formData['rg'] = patient.rg!;
        _formData['birthDate'] = patient.birthDate!;
        _formData['genre'] = patient.genre!;
        _formData['email'] = patient.email!;
        _formData['telephone'] = patient.telephone!;
        _formData['cellphone'] = patient.cellphone!;
        _formData['cep'] = patient.cep!;
        _formData['address'] = patient.address!;
        _formData['district'] = patient.district!;
        _formData['city'] = patient.city!;
        _formData['state'] = patient.state!;
        _formData['profession'] = patient.profession!;
      } else {
        _formData['sId'] = '';
        _formData['name'] = '';
        _formData['naturalness'] = '';
        _formData['maritalStatus'] = '';
        _formData['cpf'] = '';
        _formData['rg'] = '';
        _formData['birthDate'] = '';
        _formData['genre'] = '';
        _formData['email'] = '';
        _formData['telephone'] = '';
        _formData['cellphone'] = '';
        _formData['cep'] = '';
        _formData['address'] = '';
        _formData['district'] = '';
        _formData['city'] = '';
        _formData['state'] = '';
        _formData['profession'] = '';
      }
    }
  }

  Widget createTextFormField(
      {String? fieldForm,
      FocusNode? focusNode,
      String? label,
      TextInputAction? textInputAction,
      TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
        onTap: () {
          _requestFocus(focusNode!);
        },
        initialValue: _formData[fieldForm].toString(),
        focusNode: focusNode,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
            labelStyle: TextStyle(
                color: kSecondaryColor,
                fontWeight:
                    focusNode!.hasFocus ? FontWeight.bold : FontWeight.normal)),
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        onSaved: (value) => _formData[fieldForm!] = value!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Cadastro Paciente'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              _saveForm();
            },
          )
        ],
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: kSecondaryColor,
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                  key: _form,
                  child: Container(
                    child: Column(
                      children: [
                        Expanded(
                          child: Stepper(
                            controlsBuilder: (BuildContext context,
                                {VoidCallback? onStepContinue,
                                VoidCallback? onStepCancel}) {
                              return Row(
                                children: <Widget>[
                                  ElevatedButton(
                                    onPressed: onStepContinue,
                                    child: _currentStep == 2
                                        ? Text('Salvar')
                                        : Text('Continuar'),
                                  ),
                                  SizedBox(width: 15),
                                  ElevatedButton(
                                    onPressed:
                                        _currentStep == 0 ? null : onStepCancel,
                                    child: const Text('Cancelar'),
                                  ),
                                ],
                              );
                            },
                            type: stepperType,
                            physics: ScrollPhysics(),
                            currentStep: _currentStep,
                            onStepTapped: (step) => tapped(step),
                            onStepContinue: continued,
                            onStepCancel: cancel,
                            steps: <Step>[
                              Step(
                                title: new Text('Dados pessoais'),
                                subtitle: Text('informe os dados pessoais'),
                                content: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'name',
                                        label: 'nome',
                                        focusNode: _nameFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'cpf',
                                        label: 'cpf',
                                        keyboardType: defaultNumberKeyboard,
                                        focusNode: _cpfFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'rg',
                                        label: 'rg',
                                        keyboardType: defaultNumberKeyboard,
                                        focusNode: _rgFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'naturalness',
                                        label: 'naturalidade',
                                        keyboardType: defaultNumberKeyboard,
                                        focusNode: _naturalnessFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'genre',
                                        label: 'gênero',
                                        focusNode: _genreFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'birthDate',
                                        label: 'data de nascimento',
                                        focusNode: _birthDateFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'maritalStatus',
                                        label: 'estado civil',
                                        focusNode: _maritalStatusFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'profession',
                                        label: 'profissão',
                                        focusNode: _professionFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                                isActive: _currentStep >= 0,
                                state: _currentStep >= 0
                                    ? StepState.complete
                                    : StepState.disabled,
                              ),
                              Step(
                                title: new Text('Dados de contato'),
                                subtitle: Text('Informe os para contato'),
                                content: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'cellphone',
                                        label: 'celular',
                                        keyboardType: TextInputType.phone,
                                        focusNode: _cellphoneFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'telephone',
                                        label: 'telefone fixo',
                                        keyboardType: TextInputType.phone,
                                        focusNode: _telephoneFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'email',
                                        label: 'e-mail',
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        focusNode: _emailFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                                isActive: _currentStep >= 0,
                                state: _currentStep >= 2
                                    ? StepState.complete
                                    : StepState.disabled,
                              ),
                              Step(
                                title: Text('Endereço'),
                                subtitle: Text('informe o endereço'),
                                content: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: 10,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'cep',
                                        label: 'cep',
                                        focusNode: _cepFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'address',
                                        label: 'endereço',
                                        focusNode: _addressFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'district',
                                        label: 'bairro',
                                        focusNode: _districtFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'city',
                                        label: 'cidade',
                                        focusNode: _cityFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    createTextFormField(
                                        fieldForm: 'state',
                                        label: 'estado',
                                        focusNode: _stateFocusNode),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                                isActive: _currentStep >= 0,
                                state: _currentStep >= 1
                                    ? StepState.complete
                                    : StepState.disabled,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
    );
  }
}
