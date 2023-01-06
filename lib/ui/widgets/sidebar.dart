import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/side_menu_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/navigation_services.dart';
import 'package:admin_dashboard/ui/widgets/inputs/text_separator.dart';
import 'package:admin_dashboard/ui/widgets/logo.dart';
import 'package:admin_dashboard/ui/widgets/menu_items.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../router/dashboard_handlers.dart';

class Sidebar extends ConsumerWidget {
  const Sidebar({super.key});

  void navigateTo(String routeName) {
    NavigationService.navigateTo(routeName);
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(providerMenu);
    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(
            height: 50,
          ),
          const TextSeparator(
            text: "Main",
          ),
          MenuItems(
              isActive: ref.watch(providerMenu).currentPage ==
                  Flurorouter.dashboardRoute,
              text: 'Dashboard',
              icon: Icons.compass_calibration_outlined,
              onPressed: () {
                navigateTo(Flurorouter.dashboardRoute);
              }),
          MenuItems(
              text: 'Orders',
              icon: Icons.shopping_cart_checkout_outlined,
              onPressed: () => print("Hola")),
          MenuItems(
            text: 'Analitics',
            icon: Icons.show_chart_outlined,
            onPressed: () => print("Hola"),
          ),
          MenuItems(
              text: 'Categories',
              icon: Icons.layers_outlined,
              onPressed: () => print("Hola")),
          MenuItems(
              text: 'Products',
              icon: Icons.dashboard_outlined,
              onPressed: () => print("Hola")),
          MenuItems(
              text: 'Discount',
              icon: Icons.attach_money_outlined,
              onPressed: () => print("Hola")),
          MenuItems(
            text: 'Customers',
            icon: Icons.people_alt_outlined,
            onPressed: () => print("Hola"),
          ),
          const SizedBox(
            height: 30,
          ),
          const TextSeparator(
            text: "UI Elements",
          ),
          MenuItems(
              isActive:
                  ref.read(providerMenu).currentPage == Flurorouter.iconsRoute,
              text: 'Icons',
              icon: Icons.list_alt_outlined,
              onPressed: () => navigateTo(Flurorouter.iconsRoute)),
          MenuItems(
              text: 'Marketing',
              icon: Icons.mark_email_read_outlined,
              onPressed: () => print("Hola")),
          MenuItems(
              text: 'Campaign',
              icon: Icons.note_add_outlined,
              onPressed: () => print("Hola")),
          MenuItems(
              text: 'Blank',
              icon: Icons.post_add_outlined,
              onPressed: () => navigateTo(Flurorouter.blankRoute)),
          MenuItems(
              text: 'Logout',
              icon: Icons.exit_to_app_outlined,
              onPressed: () {
                ref.watch(authFormProvider).logout();
              }),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff092044),
            Color(0xff092043),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
          ),
        ],
      );
}
