import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_practice/bloc/bloc.dart';
import 'package:group_practice/events/events.dart';
import 'package:group_practice/routes/routes.dart';
import 'package:group_practice/states/states.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen() : super(key: null);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _key = GlobalKey();

  bool _isLoading = false;
  bool? _isValid;

  RegExp emailRegExp = RegExp(r'^\w+[\w-.]*@\w+((-\w+)|(\w*))\.[a-z]{2,3}$');
  RegExp contRegExp = RegExp(r'^([1-zA-Z0-1@.\s]{1,255})$');
  String? _correu;
  String? _passwd;

  StreamSubscription<LoginState>? loginSubscription;

  @override
  dispose() {
    loginSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = BlocProvider.of<LoginBloc>(context);
    loginSubscription = provider.stream.listen(_streamListener);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _body(),
    );
  }

  void _streamListener(LoginState state) {
    if (state.isValid == null) {
      setState(() {
        _passwd = '';
        _correu = '';
        _isValid = null;
      });
      return;
    } else if (state.isValid ?? false) {
      Navigator.of(context).pushNamed(Location.home.path);
    } else {
      _isValid = false;
    }

    setState(() {
      _isLoading = false;
    });
  }

  Center _body() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 200,
            child: FlutterLogo(
              size: 200,
              textColor: Colors.redAccent,
            ),
          ),
          loginOrRegisterForm(),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget loginOrRegisterForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Inicia sessió', style: TextStyle(fontSize: 30)),
        SizedBox(
          width: 300.0,
          child: _form(),
        ),
      ],
    );
  }

  Form _form() {
    return Form(
      key: _key,
      child: Column(
        children: [
          _emailField(),
          _passwdField(),
          _submitButton(),
          _formStatus(),
        ],
      ),
    );
  }

  IconButton _submitButton() {
    return IconButton(
      onPressed: () => _loginRegisterRequest(),
      icon: const Icon(Icons.arrow_forward, size: 42.0),
    );
  }

  TextFormField _emailField() {

    return TextFormField(
      controller: TextEditingController(text: _correu),
      initialValue: null,
      validator: _emailValidator,
      keyboardType: TextInputType.emailAddress,
      maxLength: 50,
      textAlign: TextAlign.left,
      decoration: const InputDecoration(
        hintText: 'Escrigui el seu correu',
        labelText: 'Correu',
        counterText: '',
        icon: Icon(Icons.email, size: 32.0),
      ),
      onSaved: (text) => _correu = text,
    );
  }

  String? _emailValidator(String? text) {
    if (text!.isEmpty) {
      return "Correu es obligatori";
    } else if (!emailRegExp.hasMatch(text)) {
      return "Format correu incorrecte";
    }

    return null;
  }

  TextFormField _passwdField() {
    return TextFormField(
      controller: TextEditingController(text: _passwd),
      initialValue: null,
      validator: _passwdValidator,
      keyboardType: TextInputType.text,
      maxLength: 20,
      textAlign: TextAlign.left,
      decoration: const InputDecoration(
        hintText: 'Escrigui la contrasenya',
        labelText: 'Contrasenya',
        counterText: '',
        icon: Icon(Icons.lock, size: 32.0),
      ),
      onSaved: (text) => _passwd = text,
    );
  }

  String? _passwdValidator(String? text) {
    if (text!.isEmpty) {
      return "Contrasenya és obligatori";
    } else if (text.length <= 5) {
      return "Contrasenya mínim de 5 caràcters";
    } else if (!contRegExp.hasMatch(text)) {
      return "Contrasenya incorrecte";
    }

    return null;
  }

  Widget _formStatus() {
    if (_isLoading) {
      return const CircularProgressIndicator();
    }

    if (_isValid != null && !_isValid!) {
      return const Text(
        'Usuari o contrasenya incorrectes',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.redAccent,
          fontSize: 16,
        ),
      );
    }

    return Container();
  }

  _loginRegisterRequest() async {
    if (_key.currentState!.validate()) {
      _key.currentState!.save();
      setState(() {
        _isLoading = true;
      });

      final provider = BlocProvider.of<LoginBloc>(context);
      provider.add(LoginEventRequest(_correu!, _passwd!));
    }
  }
}
