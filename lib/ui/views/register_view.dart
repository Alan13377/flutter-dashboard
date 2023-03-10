import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/register_form_provider.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outlined_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../widgets/inputs/custom_inputs.dart';

class RegisterView extends ConsumerWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerProvider = ref.watch(registerFormProvider);
    final authProvider = ref.watch(authFormProvider);
    return Container(
      margin: const EdgeInsets.only(top: 50),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
          //*Ancho maximo
          child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 370),
        child: Form(
          key: registerProvider.formKey,
          child: Column(
            children: [
              //**Nombre */
              TextFormField(
                style: const TextStyle(
                  color: Colors.white,
                ),
                decoration: CustomInputs.loginInputDecoration(
                  hint: "Ingrese su Nombre",
                  label: "Nombre",
                  icon: Icons.supervised_user_circle,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Introduzca su Nombre";
                  }
                  return null;
                },
                onChanged: (value) {
                  registerProvider.name = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),

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
                validator: (value) {
                  if (!EmailValidator.validate(value ?? "")) {
                    return "Email no valido";
                  }
                  return null;
                },
                onChanged: (value) {
                  registerProvider.email = value;
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
                  hint: "Ingrese su Contrase??a",
                  label: "Contrase??a",
                  icon: Icons.lock_outline_rounded,
                ),
                validator: (value) {
                  //*Retorna null si el campo es valido
                  if (value == null || value.isEmpty) {
                    return "Ingrese su Contrase??a";
                  }
                  if (value.length < 6) {
                    return "La Contrase??a debe ser mayor a 6 caracteres";
                  }
                  return null;
                },
                onChanged: (value) {
                  registerProvider.password = value;
                },
              ),
              const SizedBox(
                height: 20,
              ),

              //**ENVIO DEL FORM */
              CustomOutlinedButton(
                onPressed: () {
                  final validForm = registerProvider.validateForm();
                  if (validForm) {
                    //*Envio de Datos
                    authProvider.register(
                      registerProvider.email,
                      registerProvider.password,
                      registerProvider.name,
                    );
                  }
                },
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
