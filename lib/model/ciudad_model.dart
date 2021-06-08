import 'dart:convert';

CiudadModel ciudadModelFromJson(String str) =>
    CiudadModel.fromJson(json.decode(str));

String ciudadModelToJson(CiudadModel data) => json.encode(data.toJson());

class CiudadModel {
  CiudadModel({
    required this.id,
    required this.nombre,
    required this.seleccionado,
  });

  int id;
  String nombre;
  bool seleccionado;

  factory CiudadModel.fromJson(Map<String, dynamic> json) => CiudadModel(
        id: json["id"],
        nombre: json["nombre"],
        seleccionado: json["seleccionado"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "seleccionado": seleccionado,
      };
}

List<CiudadModel> ciudades = [
  CiudadModel(id: 1, nombre: 'Tokio', seleccionado: false),
  CiudadModel(id: 2, nombre: 'Amsterdam', seleccionado: true),
  CiudadModel(id: 3, nombre: 'Moscow', seleccionado: false),
  CiudadModel(id: 4, nombre: 'London', seleccionado: false),
];
