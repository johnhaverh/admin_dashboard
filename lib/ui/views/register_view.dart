import 'package:flutter/material.dart';

import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/buttons/custom_outline_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      //color: Colors.red,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 370),
          child: Form(
            child: Column(
              children: [
                TextFormField(
                  //validator: xx,
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomInputs.loginInputDecaration(hint: 'Ingrese su nombre', label: 'Nombre', icon: Icons.supervised_user_circle_sharp),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  //validator: xx,
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomInputs.loginInputDecaration(hint: 'Ingrese su correo', label: 'Email', icon: Icons.email_outlined),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  //validator: xx,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomInputs.loginInputDecaration(hint: '********', label: 'Contraseña', icon: Icons.lock_outline_rounded),
                ),
                const SizedBox(height: 20,),
                CustomOutlineBUtton(onPressed: (){}, text: 'Crear cuenta',isFilled: true,),
                LinkText(text: 'Ir al login', onPressed: () {Navigator.pushNamed(context, Flurorouter.loginRoute);})
              ],
            )
          )
        )
      )
    );
  }
    
}