import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/widgets/inputs/custom_inputs.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                text: "Ingresar",
              ),
              const SizedBox(
                height: 20,
              ),
              LinkText(
                text: "Nueva Cuenta",
                onPressed: () {
                  Navigator.pushNamed(context, Flurorouter.registerRoute);
                },
              )
            ],
          ),
        ),
      )),
    );
  }
}
