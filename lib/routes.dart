import 'package:disenos_app/ui/pages/diseno_uno.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> rutas() {
  return <String, WidgetBuilder>{
    'uno': (_) => DisenoUnoPage(),
  };
}
