import 'dart:math';

import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/widgets/inputs/custom_inputs.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginProvider = ref.watch(loginFormProvider);
    final authProvider = ref.watch(authFormProvider);

    return Container(
      margin: const EdgeInsets.only(top: 100),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
          //*Ancho maximo
          child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 370),
        child: Form(
          key: loginProvider.formKeyL,
          child: Column(
            children: [
              //**EMAIL */
              TextFormField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: CustomInputs.loginInputDecoration(
                  hint: "Ingrese su Correo",
                  label: "Correo",
                  icon: Icons.email_outlined,
                ),
                validator: ((value) {
                  if (!EmailValidator.validate(value ?? "")) {
                    return "Email no valido";
                  }
                  return null;
                }),
                onChanged: (value) {
                  loginProvider.email = value;
                },
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
                validator: (value) {
                  //*Retorna null si el campo es valido
                  if (value == null || value.isEmpty)
                    return "Ingrese su Contraseña";
                  if (value.length < 6)
                    return "La Contraseña debe ser mayor a 6 caracteres";
                },
                onChanged: (value) {
                  loginProvider.password = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),

              //*Envio de datos
              CustomOutlinedButton(
                onPressed: () {
                  final isValid = loginProvider.validateForm();
                  if (isValid) {
                    authProvider.login(
                        loginProvider.email, loginProvider.password);
                  }
                },
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
