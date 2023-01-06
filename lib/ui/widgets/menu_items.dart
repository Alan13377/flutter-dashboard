import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MenuItems extends HookConsumerWidget {
  final String text;
  final IconData icon;
  final bool isActive;
  final Function onPressed;
  const MenuItems({
    super.key,
    required this.text,
    required this.icon,
    this.isActive = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textColor = useState(false);
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 250,
      ),
      color: textColor.value
          ? Colors.white.withOpacity(0.1)
          : isActive
              ? Colors.white.withOpacity(0.1)
              : Colors.transparent,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isActive ? null : () => onPressed(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: MouseRegion(
              onEnter: (event) => textColor.value = true,
              onExit: (event) => textColor.value = false,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: Colors.white.withOpacity(0.3),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    text,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
