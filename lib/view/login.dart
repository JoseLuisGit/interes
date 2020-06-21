import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlatButton(
          onPressed: () {
            guardarId();
            Navigator.pushNamed(context, 'presentacion');
          },
          child: Center(child: Icon(Icons.people))),
    );
  }

  guardarId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('idUsuario', 5);
  }
}
