import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:admin_dashboard/ui/views/register_view.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final provider = ChangeNotifierProvider((ref) => AuthProvider());

class AdminHandlers extends ChangeNotifier {
  static Handler login = Handler(
    handlerFunc: (context, params) {
      final container = ProviderContainer();
      final authProvider = container.read(provider);

      //*Si no se esta autenticado
      if (authProvider.authStatus == AuthStatus.notAuthenticated) {
        return const LoginView();
      } else {
        return const DashboardView();
      }
    },
  );

  static Handler register = Handler(handlerFunc: (context, params) {
    final container = ProviderContainer();
    final authProvider = container.read(provider);

    if (authProvider.authStatus == AuthStatus.notAuthenticated) {
      return const RegisterView();
    } else {
      return const DashboardView();
    }
  });
}
