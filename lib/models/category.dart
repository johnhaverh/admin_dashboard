// ignore_for_file: library_private_types_in_public_api, unnecessary_this, unused_element

import 'dart:convert';

class Categoria {

    String uid;
    String nombre;
    _Usuario usuario;
    String? img;

    Categoria({
        required this.uid,
        required this.nombre,
        required this.usuario,
        this.img,
    });

    factory Categoria.fromJson(String str) => Categoria.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Categoria.fromMap(Map<String, dynamic> json) => Categoria(
        uid: json["uid"],
        nombre: json["nombre"],
        usuario: _Usuario.fromMap(json["usuario"]),
        img: json["img"],
    );

    Map<String, dynamic> toMap() => {
        "uid": uid,
        "nombre": nombre,
        "usuario": usuario.toMap(),
        "img": img,
    };

    @override
    String toString() {
      return 'Categoria: ${ this.nombre }';
    }
}

class _Usuario {
    
    String id;
    String nombre;

    _Usuario({
        required this.id,
        required this.nombre,
    });

    factory _Usuario.fromJson(String str) => _Usuario.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory _Usuario.fromMap(Map<String, dynamic> json) => _Usuario(
        id: json["_id"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
    };
}
