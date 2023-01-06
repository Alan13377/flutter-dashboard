import 'package:admin_dashboard/providers/side_menu_provider.dart';
import 'package:admin_dashboard/ui/widgets/navbar.dart';
import 'package:admin_dashboard/ui/widgets/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardLayout extends HookConsumerWidget {
  final Widget child;

  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SideMenuProvider.menuController =
        useAnimationController(duration: const Duration(milliseconds: 300));
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffEDF1F2),
      body: Stack(
        children: [
          Row(
            children: [
              //*Si es mas de 700px SIDEBAR
              if (size.width >= 700) const Sidebar(),

              Expanded(
                child: Column(
                  children: [
                    //**NAVBAR  */
                    const NavBar(),
                    //**VIEW */
                    Expanded(
                      child: Container(
                        color: const Color.fromARGB(101, 255, 255, 255),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: child,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),

          //*Mostrar SideBar
          if (size.width < 700)
            AnimatedBuilder(
                animation: SideMenuProvider.menuController,
                builder: (context, _) => Stack(
                      children: [
                        if (SideMenuProvider.isMenuOpen)
                          AnimatedOpacity(
                            opacity: SideMenuProvider.opacity.value,
                            duration: const Duration(
                              milliseconds: 200,
                            ),
                            child: GestureDetector(
                              onTap: () => SideMenuProvider.closeMenu(),
                              child: Container(
                                width: size.width,
                                height: size.height,
                                color: Colors.black26,
                              ),
                            ),
                          ),
                        Transform.translate(
                          offset: Offset(SideMenuProvider.movement.value, 0),
                          child: const Sidebar(),
                        ),
                      ],
                    ))
        ],
      ),
    );
  }
}
