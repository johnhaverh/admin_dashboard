// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, unused_element, use_build_context_synchronously

import 'package:admin_dashboard/ui/buttons/custom_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';

import 'package:admin_dashboard/providers/providers.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:admin_dashboard/services/notifications_service.dart';

import 'package:admin_dashboard/models/usuario.dart';

// import 'package:admin_dashboard/ui/buttons/link_text.dart';
import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/inputs/custom_inputs.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';


class UserView extends StatefulWidget {

  final String uid;
  const UserView({super.key, required this.uid});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {

  Usuario? user;

  @override
  void initState() {
    super.initState();
    final usersProvider = Provider.of<UsersProvider>(context, listen: false);
    final userFormProvider = Provider.of<UserFormProvider>(context, listen: false);
    usersProvider.getUserById(widget.uid).then((userDB) {
      if (userDB != null ) {
        userFormProvider.user = userDB;
        userFormProvider.formKey = GlobalKey<FormState>();
        setState((){user = userDB;});
      } else {
        NavigationService.replaceTo(Flurorouter.usersRoute);
      }
    });
  }

  // @override
  // void dispose() {
  //   super.dispose();
  //   user = null;
  //   Provider.of<UserFormProvider>(context, listen: false).user = null;
  // }

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          Row(
            children: [
              Center(child: Text('User View', style: CustomLabels.h1,)),
              const Spacer(),
              // LinkText(text: 'Volver', color: Colors.blueAccent,onPressed: () {Navigator.pushReplacementNamed(context, Flurorouter.usersRoute);}),

              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 120),
                child: CustomIconButton(
                  text: 'Volver', icon: Icons.arrow_back,
                  onPressed: (){
                  Navigator.pushReplacementNamed(context, Flurorouter.usersRoute);},
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          if (user == null) 
            WhiteCard(
              child: Container(
                alignment: Alignment.center,
                height: 300,
                child: const CircularProgressIndicator(),
              ),
            ),
          if (user != null)
            const UserViewBody(),
        ],
      )
    );
  }
}

class UserViewBody extends StatelessWidget {
  const UserViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Table(
        columnWidths: const {
          0: FixedColumnWidth(250),
        },
        children: const [
          TableRow(
            children: [
              _AvatarContainer(),
              _UserViewForm()
            ]
          )
        ],
      )
    );
  }
}

class _UserViewForm extends StatelessWidget {
  const _UserViewForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final   userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;

    return WhiteCard(
      title: 'Información General',
      child: Form(
        key: userFormProvider.formKey,
        autovalidateMode: AutovalidateMode.always,
        child: Column(
          children: [
            TextFormField(
              initialValue: user.nombre,
              decoration: CustomInputs.formInputDecoration(
                hint: 'Nombre del usuario', 
                label: 'Nombre', 
                icon: Icons.supervised_user_circle_outlined
              ),
              onChanged: (value) => userFormProvider.copyUserWith(nombre: value),
              validator: (value){
                if (value == null || value.isEmpty ) return 'Ingrese su nombre';
                if (value.length < 3 ) return 'El nombre debe tener minimo 3 caracteres';
                return null;
              },
            ),            
            const SizedBox(height: 20,),
            TextFormField(
              initialValue: user.correo,
              decoration: CustomInputs.formInputDecoration(
                hint: 'Correo del usuario', 
                label: 'Correo', 
                icon: Icons.mark_email_read_outlined
              ),
              onChanged: (value) => userFormProvider.copyUserWith(correo: value),
              validator: (value) {
              if (!EmailValidator.validate(value ?? '')) return 'Email no valido';
                return null;
              },
            ),
            const SizedBox(height: 20,),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 140),
              child: ElevatedButton(
                onPressed: () async {
                  final saved = await userFormProvider.updateUser();
                  Provider.of<AuthProvider>(context, listen: false).refreshUser(user);
                  Provider.of<UsersProvider>(context, listen: false).refreshUser(user);
                  if (saved){
                    //NotificationsService.showSnackbarMessage('Usuario actualizado');
                    NotificationsService.showMessage(context,'Usuario actualizado');
                  } else {
                    NotificationsService.showSnackbarError('No se pudo actualizar usuario');
                  }
                }, 
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.indigo.withOpacity(0.5)),
                  shadowColor: MaterialStateProperty.all(Colors.transparent)
                ),
                child: const Row(
                  children: [
                    Icon(Icons.save_outlined,size: 20,),
                    Text(' Guardar'),
                  ],
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}

class _AvatarContainer extends StatelessWidget {
  const _AvatarContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final userFormProvider = Provider.of<UserFormProvider>(context);
    final user = userFormProvider.user!;
    final image = ( user.img == null || user.img == '') 
    ? const Image(image: AssetImage('no-image.jpg')) 
    : FadeInImage.assetNetwork(placeholder: 'loader.gif', image: user.img!);


    return WhiteCard(
      width: 250,
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Profile', style: CustomLabels.h2,),
            const SizedBox(height: 20,),
            Container(
              width: 150,
              height: 150,
              child: Stack(
                children: [
                  ClipOval(
                    child: image,
                  ),
                  Positioned(
                    bottom: 5,
                    right: 5,
                    child: Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: Colors.white,width: 5)
                      ),
                      child: FloatingActionButton(
                        backgroundColor: Colors.indigo,
                        elevation: 0,
                        child: const Icon (Icons.camera_alt_outlined, size: 20,),
                        onPressed: () async {
                          FilePickerResult? result = await FilePicker.platform.pickFiles(
                                type: FileType.custom,
                                allowedExtensions: ['jpg', 'jpeg', 'png'],
                                allowMultiple: false,
                          );   
                          if (result != null){
                            PlatformFile file = result.files.first;
                            NotificationsService.showBusyIndicator(context);
                            final newUser = await userFormProvider.uploadImage('/uploads/usuarios/${user.uid}', file.bytes!);
                            Provider.of<UsersProvider>(context, listen: false).refreshUser(newUser);
                            Provider.of<AuthProvider>(context, listen: false).refreshUser(newUser);
                            Navigator.of(context).pop();
                          }

                        }
                      )
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Text(user.nombre, style: const TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),          
          ]
        ),
        
      ),
    );
  }
}