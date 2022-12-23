import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

class LinksBar extends StatelessWidget {
  const LinksBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        height: size.width > 1000 ? size.height * 0.1 : null,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              LinkText(
                text: "About",
                onPressed: () => print("About"),
              ),
              const LinkText(text: "Help Center"),
              const LinkText(text: "Services"),
              const LinkText(text: "Privacy Policy"),
              const LinkText(text: "Fax Info"),
              const LinkText(text: "Blog"),
              const LinkText(text: "Status"),
              const LinkText(text: "Careers"),
              const LinkText(text: "Brand Resources"),
              const LinkText(text: "Marketing"),
            ],
          ),
        ));
  }
}
