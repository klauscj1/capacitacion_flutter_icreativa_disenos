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
      floatingActionButton: FloatingActionButton(
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
    );
  }
}
