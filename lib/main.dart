import 'package:flutter/material.dart';
import 'package:intereses/view/interes.dart';
import 'package:intereses/view/login.dart';
import 'package:intereses/view/presentacion.dart';
import 'view/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      routes: {
        'home': (context) => HomePage(),
        'interes': (context) => InteresPage(),
        'login': (context) => LoginPage(),
        'presentacion': (context) => Presentacion()
      },
      initialRoute: 'login',
    );
  }
}
