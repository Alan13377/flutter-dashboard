import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:fluro/fluro.dart';

import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final provider = ChangeNotifierProvider((ref) => AuthProvider());

class DashboardHandlers {
  static Handler dashboard = Handler(handlerFunc: (context, params) {
    final container = ProviderContainer();
    final authProvider = container.read(provider);

    if (authProvider.authStatus == AuthStatus.checking) {
      print(authProvider.authStatus);

      return DashboardView();
    } else
      return LoginView();
  });
}
