import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/dashboard_handler.dart';
import 'package:admin_dashboard/router/no_page_found_handler.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String routeRoute = "/";
  //*Auth Router
  static String loginRoute = "/auth/login";
  static String registerRoute = "/auth/register";

  //*Dashboard
  static String dashboardRoute = "/dashboard";

  static void configureRoutes() {
    //*Auth Routes
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(routeRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.none);
    //**DashBoard */
    router.define(dashboardRoute,
        handler: DashboardHandlers.dashboard,
        transitionType: TransitionType.fadeIn);

    //* 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFoundHandlers;
  }
}
