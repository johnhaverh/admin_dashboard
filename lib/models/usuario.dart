import 'dart:convert';

class Usuario {
  
    String? uid;
    String nombre;
    String correo;
    String? rol;
    bool? estado;
    bool? google;
    String? img;

    Usuario({
        required this.uid,
        required this.nombre,
        required this.correo,
        required this.rol,
        required this.estado,
        required this.google,
        this.img
    });

    factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        uid: json["uid"],
        nombre: json["nombre"],
        correo: json["correo"],
        rol: json["rol"],
        estado: json["estado"],
        google: json["google"],
        img: json["img"],
    );

    Map<String, dynamic> toMap() => {
        "uid": uid,
        "nombre": nombre,
        "correo": correo,
        "rol": rol,
        "estado": estado,
        "google": google,
        "img": img
    };
}
