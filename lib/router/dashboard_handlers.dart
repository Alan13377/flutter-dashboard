import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/side_menu_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/views/blank_view.dart';
import 'package:admin_dashboard/ui/views/dashboard_view.dart';
import 'package:admin_dashboard/ui/views/icons_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:fluro/fluro.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final provider = ChangeNotifierProvider((ref) => AuthProvider());
final providerMenu = ChangeNotifierProvider((ref) => SideMenuProvider());

class DashboardHandlers {
  static Handler dashboard = Handler(handlerFunc: (context, params) {
    final container = ProviderContainer();
    final authProvider = container.read(provider);

    final menu = container.read(providerMenu);
    menu.setCurrentPage(Flurorouter.dashboardRoute);
    if (authProvider.authStatus == AuthStatus.checking) {
      return const DashboardView();
    } else {
      return const LoginView();
    }
  });

  //**RUTAS */
  static Handler icon = Handler(handlerFunc: (context, params) {
    final container = ProviderContainer();
    final authProvider = container.read(provider);

    final menu = container.read(providerMenu);
    menu.setCurrentPage(Flurorouter.iconsRoute);

    if (authProvider.authStatus == AuthStatus.checking) {
      return const IconsView();
    } else {
      return const LoginView();
    }
  });
  static Handler blankV = Handler(handlerFunc: (context, params) {
    final container = ProviderContainer();
    final authProvider = container.read(provider);

    if (authProvider.authStatus == AuthStatus.checking) {
      return const BlankView();
    } else {
      return const LoginView();
    }
  });
}
