import 'package:disenos_app/ui/pages/diseno_uno.dart';
import 'package:disenos_app/ui/pages/diseno_uno_logica.dart';
import 'package:disenos_app/ui/pages/home.dart';
import 'package:disenos_app/ui/pages/login.dart';
import 'package:disenos_app/ui/pages/register.dart';
import 'package:disenos_app/ui/pages/splash.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> rutas() {
  return <String, WidgetBuilder>{
    '/': (_) => SplashPage(),
    'uno': (_) => DisenoUnoPage(),
    'uno_logica': (_) => DisenoUnoPageLogica(),
    'login': (_) => LoginPage(),
    'register': (_) => RegisterPage(),
    'home': (_) => HomePage(),
  };
}
