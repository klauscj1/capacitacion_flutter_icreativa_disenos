import 'package:disenos_app/domain/bloc/gps_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GpsPage extends StatelessWidget {
  const GpsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gpsBloc = Provider.of<GpsBloc>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
            'Coordenadas: ${gpsBloc.locationData.latitude} - ${gpsBloc.locationData.longitude} -> ${gpsBloc.locationData.altitude}'),
      ),
    );
  }
}
