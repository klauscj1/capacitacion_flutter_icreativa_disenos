import 'package:disenos_app/domain/bloc/gps_bloc.dart';
import 'package:disenos_app/domain/bloc/slide_bloc.dart';
import 'package:disenos_app/ui/widgets/camera_widget.dart';
import 'package:disenos_app/ui/widgets/card_widget.dart';
import 'package:disenos_app/ui/widgets/city_list__widget.dart';
import 'package:disenos_app/ui/widgets/custom_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final slideBloc = Provider.of<SlideBloc>(context);
    final gpsBloc = Provider.of<GpsBloc>(context, listen: false);
    return Scaffold(
        body: Column(
          children: [
            CustomAppBar(),
            CityListWidget(),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: slideBloc.tarjetas.length,
                itemBuilder: (BuildContext context, int index) {
                  return CardWidget(
                    tarjeta: slideBloc.tarjetas[index],
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'gps',
              backgroundColor: Colors.black.withOpacity(.7),
              onPressed: () {
                gpsBloc.obtenerUbicacion();
                Navigator.pushNamed(context, 'gps');
              },
              child: Icon(
                Icons.location_on,
                size: 30,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              heroTag: 'camara',
              backgroundColor: Colors.black.withOpacity(.7),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CapturarFotoWidget(),
                  ),
                );
              },
              child: Icon(
                Icons.camera_alt_outlined,
                size: 30,
              ),
            ),
          ],
        ));
  }
}
