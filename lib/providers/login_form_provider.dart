import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginFormProvider = ChangeNotifierProvider(
  (ref) => LoginFormProvider(),
);

class LoginFormProvider extends ChangeNotifier {
  String _email = "";
  String _password = "";
  GlobalKey<FormState> formKeyL = GlobalKey<FormState>();

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

  bool validateForm() {
    if (formKeyL.currentState!.validate()) {
      // print("Form valid ... login");
      // print("${email} -- ${password}");
      // authProvider.login(email, password);

      return true;
    } else {
      // print("Form not valid ...fail");
      return false;
    }
  }
}
