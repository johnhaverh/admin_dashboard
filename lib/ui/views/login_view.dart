import 'package:flutter/material.dart';
import 'package:admin_dashboard/ui/buttons/custom_outline_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                  decoration: buildInputDecaration(hint: 'Ingrese su correo', label: 'Email', icon: Icons.email_outlined),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  //validator: xx,
                  obscureText: true,
                  style: const TextStyle(color: Colors.white),
                  decoration: buildInputDecaration(hint: '********', label: 'Contraseña', icon: Icons.lock_outline_rounded),
                ),
                const SizedBox(height: 20,),
                CustomOutlineBUtton(onPressed: (){}, text: 'Ingrear',isFilled: true,),
                LinkText(text: 'Nueva cuenta', onPressed: () {},),


              ],
            )
          )
        )
      )
    );
  }

  InputDecoration buildInputDecaration({required String hint, required String label, required IconData icon,}){

    return InputDecoration(
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white.withOpacity(0.3))),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.grey),
      hintStyle: const TextStyle(color: Colors.grey),
      labelStyle: const TextStyle(color: Colors.grey),
    );
  } 
    
}