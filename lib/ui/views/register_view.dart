import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/register_form_provider.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/buttons/custom_outline_button.dart';
import 'package:admin_dashboard/ui/buttons/link_text.dart';

import 'package:email_validator/email_validator.dart';
class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    
    return ChangeNotifierProvider(
      create: ( _ ) => RegisterFormProvider(),
      child: Builder(
        builder: (context) {
          final registerFormProvider = Provider.of<RegisterFormProvider>(context, listen: false);
          return Container(
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            //color: Colors.red,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 370),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: registerFormProvider.formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        onFieldSubmitted: ( _ ) => onFormSubmit(registerFormProvider,authProvider),
                        validator: (value){
                          if (value == null || value.isEmpty ) return 'Ingrese su nombre';
                          if (value.length < 3 ) return 'El nombre debe tener minimo 3 caracteres';
                          return null;
                        },
                        onChanged: (value) => registerFormProvider.name = value,
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecaration(hint: 'Ingrese su nombre', label: 'Nombre', icon: Icons.supervised_user_circle_sharp),
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        onFieldSubmitted: ( _ ) => onFormSubmit(registerFormProvider,authProvider),
                        validator: (value) {
                          if (!EmailValidator.validate(value ?? '')) return 'Email no valido';
                              return null;
                        },
                        onChanged: (value) => registerFormProvider.email = value,
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecaration(hint: 'Ingrese su correo', label: 'Email', icon: Icons.email_outlined),
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        onFieldSubmitted: ( _ ) => onFormSubmit(registerFormProvider,authProvider),
                        validator: (value){
                          if (value == null || value.isEmpty ) return 'Ingrese su contraseña';
                          if (value.length < 8 ) return 'Su contraseña debe tener minimo 8 caracteres';
                          return null;
                        },
                        onChanged: (value) => registerFormProvider.password = value,
                        obscureText: true,
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomInputs.loginInputDecaration(hint: '********', label: 'Contraseña', icon: Icons.lock_outline_rounded),
                      ),
                      const SizedBox(height: 20,),
                      CustomOutlineButton(
                        onPressed: () => onFormSubmit(registerFormProvider, authProvider), text: 'Crear cuenta', isFilled: true,),
                      LinkText(text: 'Ir al login', onPressed: () {Navigator.pushReplacementNamed(context, Flurorouter.loginRoute);})
                    ],
                  )
                )
              )
            )
          );
        }
      ),
    );
  }
    
  void onFormSubmit(RegisterFormProvider registerFormProvider, AuthProvider authProvider){
    final validForm = registerFormProvider.validateForm();
    if (!validForm) return;
    authProvider.register(registerFormProvider.email, registerFormProvider.password, registerFormProvider.name);
  }
}