import 'package:disenos_app/domain/bloc/slide_bloc.dart';
import 'package:disenos_app/domain/utils/preferencias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // final slideProvider = Provider.of<SlideBloc>(context, listen: false);
    //slideProvider.cargarSlides();
    Future.delayed(Duration(milliseconds: 800), () {
      Preferencias pref = Preferencias();
      String token = pref.token;
      if (token.length > 0) {
        print('si tiene token');
        Navigator.pushReplacementNamed(context, 'home');
      } else {
        print('no tiene token');
        Navigator.pushReplacementNamed(context, 'uno');
      }
    });
    Provider.of<SlideBloc>(context, listen: false).cargarSlides();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            'Diseños App',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
