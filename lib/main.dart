import 'package:disenos_app/domain/bloc/login_bloc.dart';
import 'package:disenos_app/domain/bloc/register_bloc.dart';
import 'package:disenos_app/domain/bloc/slide_bloc.dart';
import 'package:disenos_app/domain/utils/preferencias.dart';
import 'package:disenos_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Preferencias pref = Preferencias();
  await pref.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SlideBloc()),
        ChangeNotifierProvider(create: (_) => LoginBloc()),
        ChangeNotifierProvider(create: (_) => RegisterBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: '/',
        routes: rutas(),
      ),
    );
  }
}
