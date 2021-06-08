import 'package:disenos_app/model/services/usuario_service.dart';
import 'package:flutter/material.dart';

class RegisterBloc extends ChangeNotifier {
  //Variables
  String _correo = '';
  String _password = '';
  String _nombre = '';

  bool _permitir = false;

//Gets
  String get correo => this._correo;
  String get password => this._password;
  String get nombre => this._nombre;

  bool get permitir => this._permitir;

//Sets
  set correo(String correo) {
    this._correo = correo;
    if (this._password.length > 0) {
      if (this._correo.length > 0) {
        if (this._nombre.length > 0) {
          this._permitir = true;
        } else {
          this._permitir = false;
        }
      } else {
        this._permitir = false;
      }
    } else {
      this._permitir = false;
    }
    notifyListeners();
  }

  set password(String password) {
    this._password = password;
    if (this._password.length > 0) {
      if (this._correo.length > 0) {
        if (this._nombre.length > 0) {
          this._permitir = true;
        } else {
          this._permitir = false;
        }
      } else {
        this._permitir = false;
      }
    } else {
      this._permitir = false;
    }
    notifyListeners();
  }

  set nombre(String nombre) {
    this._nombre = nombre;
    if (this._password.length > 0) {
      if (this._correo.length > 0) {
        if (this._nombre.length > 0) {
          this._permitir = true;
        } else {
          this._permitir = false;
        }
      } else {
        this._permitir = false;
      }
    } else {
      this._permitir = false;
    }
    notifyListeners();
  }

  set permitir(bool permitir) {
    this._permitir = permitir;
    notifyListeners();
  }

  //Metodos propios

  void registro(BuildContext context) async {
    print(this._correo);
    print(this._password);
    print(this._nombre);
    await UsuarioService.register(
      context,
      this._correo,
      this._password,
      this._nombre,
    );
  }
}
