import 'dart:convert';

RegisterRequestModel registerRequestModelFromJson(String str) =>
    RegisterRequestModel.fromJson(json.decode(str));

String registerRequestModelToJson(RegisterRequestModel data) =>
    json.encode(data.toJson());

class RegisterRequestModel {
  RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.tipo,
    required this.activo,
  });

  String name;
  String email;
  String password;
  int tipo;
  bool activo;

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      RegisterRequestModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        tipo: json["tipo"],
        activo: json["activo"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "tipo": tipo,
        "activo": activo,
      };
}
