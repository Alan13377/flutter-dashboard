import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_services.dart';
import "package:flutter/material.dart";
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authFormProvider = ChangeNotifierProvider((ref) => AuthProvider());

enum AuthStatus { checking, authenticated, notAuthenticated }

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

    print("almacenar JSONWEBTOKEN: ${_token}");
    //*TODO Navegar a Dashboard */
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

    //*TODO Comprobar si el token es valido
    await Future.delayed(Duration(milliseconds: 1000));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}
