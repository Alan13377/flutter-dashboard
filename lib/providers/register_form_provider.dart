import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final registerFormProvider =
    ChangeNotifierProvider((ref) => RegisterFormProvider());

class RegisterFormProvider extends ChangeNotifier {
  String _name = "";
  String _email = "";
  String _password = "";

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String get name => _name;

  set name(String name) {
    _name = name;
    notifyListeners();
  }

  String get email => _email;

  set email(String email) {
    _email = email;
    notifyListeners();
  }

  String get password => _password;

  set password(String password) {
    _password = password;
    notifyListeners();
  }

  validateForm() {
    if (formKey.currentState!.validate()) {
      print("Registro valido $name $email $password");
      return true;
    } else {
      print("Registro no valido $name $email $password");
      return false;
    }
  }
}
