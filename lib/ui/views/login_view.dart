import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:admin_dashboard/providers/login_form_provider.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:email_validator/email_validator.dart';

import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/buttons/custom_outline_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);

    return ChangeNotifierProvider(
      create: ( _ ) => LoginFormProvider(),
      child: Builder(
        builder: (context) {
        final loginFormProvider = Provider.of<LoginFormProvider>(context, listen: false);
        return Container(
          margin: const EdgeInsets.only(top: 100),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 370),
              child: Form(
                autovalidateMode: AutovalidateMode.always,
                key: loginFormProvider.formKey,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (value) {
                        if (!EmailValidator.validate(value ?? '')) return 'Email no valido';
                        
                        return null;
                      },
                      onChanged: (value) => loginFormProvider.email = value,
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.loginInputDecaration(hint: 'Ingrese su correo', label: 'Email', icon: Icons.email_outlined),
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      validator: (value){
                        if (value == null || value.isEmpty ) return 'Ingrese su contraseña';
                        if (value.length < 8 ) return 'Su contraseña debe tener minimo 8 caracteres';
                        return null;
                      },
                      onChanged: (value) => loginFormProvider.password = value,
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: CustomInputs.loginInputDecaration(hint: '********', label: 'Contraseña', icon: Icons.lock_outline_rounded),
                    ),
                    const SizedBox(height: 20,),
                    CustomOutlineButton(
                      onPressed: (){ 
                        final isValid = loginFormProvider.validateForm();
                        if (!isValid) return;
                          authProvider.login(loginFormProvider.email, loginFormProvider.password);

                      }, text: 'Ingrear',isFilled: true,),
                    LinkText(text: 'Nueva cuenta', onPressed: () {Navigator.pushNamed(context, Flurorouter.registerRoute);})
                  ],
                )
              )
            )
          )
        );
        }
      )  
    );
  }    
}