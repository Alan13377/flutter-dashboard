import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LinkText extends HookConsumerWidget {
  final String text;
  final Function? onPressed;
  const LinkText({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textUnderline = useState(TextDecoration.none);
    return GestureDetector(
      onTap: () {
        if (onPressed != null) onPressed!();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (value) {
            textUnderline.value = TextDecoration.underline;
          },
          onExit: (value) {
            textUnderline.value = TextDecoration.none;
          },
          child: Text(
            text,
            style: GoogleFonts.roboto(
                color: Colors.grey[700],
                fontSize: 20,
                decoration: textUnderline.value),
          ),
        ),
      ),
    );
  }
}
