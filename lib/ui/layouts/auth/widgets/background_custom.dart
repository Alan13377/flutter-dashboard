import 'package:flutter/material.dart';

class BackGroundCustom extends StatelessWidget {
  const BackGroundCustom({super.key});

  @override
  Widget build(BuildContext context) {
    //*Toma todo el ancho disponible
    return Container(
      decoration: buildBoxDecoration(),
      child: Container(
        //*Limitar el tamaño de la imagen
        constraints: const BoxConstraints(maxWidth: 400),
        child: Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Image.asset(
                "twitter-white-logo.png",
                width: 400,
              )),
        ),
      ),
    );
  }

  //*Decoracion del fondo
  BoxDecoration buildBoxDecoration() {
    return const BoxDecoration(
        image: DecorationImage(
      image: AssetImage(
        "twitter-bg.png",
      ),
      fit: BoxFit.cover,
    ));
  }
}
