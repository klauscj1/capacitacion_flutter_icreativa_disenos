import 'dart:convert';

import 'package:disenos_app/domain/utils/constantes.dart';
import 'package:disenos_app/domain/utils/preferencias.dart';
import 'package:disenos_app/model/request/login_request_model.dart';
import 'package:disenos_app/model/request/register_request_model.dart';
import 'package:disenos_app/model/response/login_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsuarioService {
  static Future<void>? login(
      BuildContext context, String correo, String password) async {
    try {
      mostrarAlertas(context, "Espera...", "Iniciando sesión...", false);
      LoginRequestModel peticion =
          LoginRequestModel(email: correo, password: password);
      var respuesta = await http.post(
        Uri.parse(API_URL + "auth"),
        body: json.encode(
          peticion.toJson(),
        ),
        headers: <String, String>{'Content-Type': 'application/json'},
      );
      var jsonData = json.decode(respuesta.body);
      LoginResponseModel slideResponse = LoginResponseModel.fromJson(jsonData);
      Navigator.pop(context);
      if (slideResponse.ok == true) {
        Preferencias pref = Preferencias();
        pref.token = slideResponse.token!;
        Navigator.pushReplacementNamed(context, 'home');
      } else {
        mostrarAlertas(context, "Error", slideResponse.msg!, true);
      }
    } catch (error) {
      print(error);
      Navigator.pop(context);
    }
  }

  static Future<void>? register(
      BuildContext context, String correo, String password, String name) async {
    try {
      mostrarAlertas(context, "Espera...", "Registrando tu cuenta...", false);
      RegisterRequestModel peticion = RegisterRequestModel(
        email: correo,
        password: password,
        name: name,
        tipo: 1,
        activo: true,
      );
      var respuesta = await http.post(
        Uri.parse(API_URL + "auth/new"),
        body: json.encode(
          peticion.toJson(),
        ),
        headers: <String, String>{'Content-Type': 'application/json'},
      );
      var jsonData = json.decode(respuesta.body);
      LoginResponseModel slideResponse = LoginResponseModel.fromJson(jsonData);
      Navigator.pop(context);
      if (slideResponse.ok == true) {
        Preferencias pref = Preferencias();
        pref.token = slideResponse.token!;
        Navigator.pushReplacementNamed(context, 'home');
      } else {
        mostrarAlertas(context, "Error", slideResponse.msg!, true);
      }
    } catch (error) {
      print(error);
      Navigator.pop(context);
    }
  }

  static void mostrarAlertas(
      BuildContext context, String titulo, String mensaje, bool error) {
    showDialog(
      barrierDismissible: error,
      context: context,
      builder: (_) {
        return AlertDialog(
          title: Text(titulo),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              !error ? CircularProgressIndicator() : Container(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Text(mensaje),
              )
            ],
          ),
          actions: error
              ? [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('OK'),
                  )
                ]
              : [],
        );
      },
    );
  }
}
