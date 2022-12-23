import 'package:admin_dashboard/ui/layouts/auth/widgets/background_custom.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/custom_title.dart';
import 'package:admin_dashboard/ui/layouts/auth/widgets/links_bar.dart';
import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  const AuthLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final ScrollController controller =
        ScrollController(initialScrollOffset: 0);
    return Scaffold(
        body: Scrollbar(
      controller: controller,
      child: ListView(
        physics: ClampingScrollPhysics(),
        controller: controller,
        children: [
          //*Desktop
          size.width > 1000
              ? _DesktopBody(
                  child: child,
                )
              :
              //*Mobile
              _MobileBody(child: child),
          //*Links
          LinksBar(),
        ],
      ),
    ));
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;
  const _DesktopBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width, //*Todo el ancho de la vista
      height: size.height * 0.95,
      child: Row(
        children: [
          //*Twitter BackGround - izquierdo
          const BackGroundCustom(),

          //* View Container - derecho
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const CustomTitle(),
                const SizedBox(height: 50),
                //*Vistas dinamicas
                Expanded(child: child)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;
  const _MobileBody({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const CustomTitle(),
          SizedBox(
            width: double.infinity,
            height: 420,
            child: child,
          ),
          const SizedBox(
            width: double.infinity,
            height: 400,
            child: BackGroundCustom(),
          ),
        ],
      ),
    );
  }
}
