import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_services.dart';
import 'package:admin_dashboard/ui/layouts/auth/auth_layout.dart';
import 'package:admin_dashboard/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:admin_dashboard/ui/layouts/splash/splash_layout.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  Flurorouter.configureRoutes();
  await LocalStorage.configurePrefs();
  runApp(
    ProviderScope(
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProvider = ref.watch(authFormProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      initialRoute: Flurorouter.routeRoute,
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      builder: (context, child) {
        //*Child Dinamico

        //**NAVEGACION SI ESTA AUTENTICADO */
        if (authProvider.authStatus == AuthStatus.checking)
          return SplashLayout();

        //**Regresar Layout */
        if (authProvider.authStatus == AuthStatus.authenticated) {
          return DashboardLayout(child: child!);
        } else {
          return AuthLayout(
            child: child!,
          );
        }
      },
      theme: ThemeData.light().copyWith(
        scrollbarTheme: ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(Color(0xffa8a8a8)),
        ),
      ),
    );
  }
}
