import 'package:admin_dashboard/api/Cafe_api.dart';
import 'package:admin_dashboard/models/http/auth_response_model.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_services.dart';
import 'package:admin_dashboard/services/notifications_services.dart';
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
  Usuario? user;

  AuthProvider() {
    isAuthenticated();
  }

  //*Metodo de Logueo
  login(String email, String password) async {
    final data = {
      "correo": email,
      "password": password,
    };
    //*Peticion HTTP
    try {
      final request = await CafeApi.httpPost("/auth/login", data);
      final authResponse = AuthResponse.fromMap(request);
      user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString("token", authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      CafeApi.configureDio();
      isAuthenticated();
      notifyListeners();
      return request;
    } catch (e) {
      print(e);

      //*Mostrar Notificacion de error
      NotificationService.showSnackbarError("Error en la autenticacion");
    }
  }

  //*Metodo de Registro
  register(String email, String password, String name) async {
    final data = {
      "nombre": name,
      "correo": email,
      "password": password,
    };

    //*Peticion HTTP
    try {
      final request = await CafeApi.httpPost("/usuarios", data);
      final authResponse = AuthResponse.fromMap(request);
      user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString("token", authResponse.token);
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
      CafeApi.configureDio();
      isAuthenticated();
      notifyListeners();
      return request;
    } catch (e) {
      print(e);

      //*Mostrar Notificacion de error
      NotificationService.showSnackbarError("Error en la autenticacion");
    }
  }

  //**VERIFICAR SI SE ESTA AUTENTICADO */
  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString("token");
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    //**Comprobar JWT VALIDO */
    try {
      final response = await CafeApi.httpGet("/auth");
      final authResponse = AuthResponse.fromMap(response);
      LocalStorage.prefs.setString("token", authResponse.token);
      user = authResponse.usuario;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return false;
    } catch (e) {
      print(e);
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  logout() {
    LocalStorage.prefs.remove("token");
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}
