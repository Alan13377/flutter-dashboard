import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_services.dart';
import "package:flutter/material.dart";
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum AuthStatus {
  checking,
  authenticated,
  notAuthenticated,
}

final authFormProvider = ChangeNotifierProvider((ref) => AuthProvider());

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }

  //*Funcion de Logueo
  login(String email, String password) {
    //TODO Peticion HTTP
    _token = "asdsdsfggdfghlskkfñf";
    LocalStorage.prefs.setString("token", _token!);

    authStatus = AuthStatus.authenticated;

    notifyListeners();
    isAuthenticated();

    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  //**VERIFICAR SI SE ESTA AUTENTICADO */
  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString("token");
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    await Future.delayed(Duration(milliseconds: 1000));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}
