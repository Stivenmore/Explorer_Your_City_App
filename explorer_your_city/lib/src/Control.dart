import 'package:explorer_your_city/src/Pages/Autenticate/Login&Register.dart';
import 'package:explorer_your_city/src/Pages/Home/Home.dart';
import 'package:explorer_your_city/src/Repository/Repository.dart';
import 'package:explorer_your_city/src/Models/Categorias.dart';
import 'package:flutter/material.dart';

class Control extends StatefulWidget {
  Control({Key key}) : super(key: key);

  @override
  _ControlState createState() => _ControlState();
}

class _ControlState extends State<Control> {
  final Categoria categoria;

  _ControlState({this.categoria});

  render() {
    if (Services().isAuth) {
      return Home(categoria: categoria);
    }
    return LoginandRegister();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: render(),
    );
  }
}
