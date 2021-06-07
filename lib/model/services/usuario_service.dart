import 'dart:convert';

import 'package:disenos_app/domain/utils/constantes.dart';
import 'package:disenos_app/model/request/login_request_model.dart';
import 'package:disenos_app/model/response/login_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UsuarioService {
  static Future<void>? login(
      BuildContext context, String correo, String password) async {
    try {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text('Espera...'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Text('Iniciando sesión...'),
                )
              ],
            ),
          );
        },
      );
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
        print(slideResponse);
        print(slideResponse.name);
        print(slideResponse.uid);
        print(slideResponse.token);
      } else {
        print(slideResponse.msg);
        showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text('Error'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Text(slideResponse.msg!),
                  )
                ],
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK'),
                )
              ],
            );
          },
        );
      }
    } catch (error) {
      print(error);
      Navigator.pop(context);
    }
  }
}
