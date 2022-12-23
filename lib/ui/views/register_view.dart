import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:flutter/material.dart';

import '../widgets/inputs/custom_inputs.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          //*Ancho maximo
          child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 370),
        child: Form(
          child: Column(
            children: [
              //**EMAIL */
              TextFormField(
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: CustomInputs.loginInputDecoration(
                  hint: "Ingrese su Nombre",
                  label: "Nombre",
                  icon: Icons.supervised_user_circle,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(
                  color: Colors.white,
                ),
                decoration: CustomInputs.loginInputDecoration(
                  hint: "Ingrese su Correo",
                  label: "Correo",
                  icon: Icons.email_outlined,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //**PASSWORD */
              TextFormField(
                obscureText: true,
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: CustomInputs.loginInputDecoration(
                  hint: "Ingrese su Contraseña",
                  label: "Contraseña",
                  icon: Icons.lock_outline_rounded,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomOutlinedButton(
                onPressed: () {},
                text: "Crear Cuenta",
              ),
              const SizedBox(
                height: 20,
              ),
              LinkText(
                text: "Ir al Login",
                onPressed: () {
                  //**TODO ir a Login */
                  Navigator.pushNamed(context, Flurorouter.loginRoute);
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
