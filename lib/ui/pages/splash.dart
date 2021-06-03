import 'package:disenos_app/domain/bloc/slide_bloc.dart';
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
      Navigator.pushReplacementNamed(context, 'uno');
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
