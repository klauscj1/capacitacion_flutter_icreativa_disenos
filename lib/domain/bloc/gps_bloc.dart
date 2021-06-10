import 'package:flutter/material.dart';
import 'package:location/location.dart';

class GpsBloc extends ChangeNotifier {
//variables

  Location location = new Location();

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;
  late LocationData _locationData;
  bool _iniciado = false;

  //get

  LocationData get locationData => this._locationData;

  //metodos propios
  void obtenerUbicacion() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    if (!this._iniciado) {
      iniciarGps();
    }

    _locationData = await location.getLocation();
    print(_locationData);
  }

  void iniciarGps() {
    print('Se inicia el listen del gps');
    this._iniciado = true;
    location.onLocationChanged.listen((LocationData currentLocation) {
      _locationData = currentLocation;
      notifyListeners();
    });
  }
}
