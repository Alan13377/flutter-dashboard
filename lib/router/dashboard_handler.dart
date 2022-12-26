import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:admin_dashboard/ui/views/register_view.dart';
import 'package:fluro/fluro.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(
    handlerFunc: (context, parameters) {
      final authProvider = AuthProvider();
      if (authProvider.authStatus == AuthStatus.authenticated)
        return DashboardView();
      else
        return LoginView();
    },
  );
}
