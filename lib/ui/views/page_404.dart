import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Page404 extends StatelessWidget {
  const Page404({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "404 Pagina No Encontrada",
          style: GoogleFonts.montserratAlternates(
              fontSize: 50, fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ),
    );
  }
}
