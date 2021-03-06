import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:explorer_your_city/src/Pages/Autenticate/Login&Register.dart';
import 'package:explorer_your_city/src/Pages/Home/Search.dart';
import 'package:explorer_your_city/src/Repository/Repository.dart';
import 'package:explorer_your_city/src/Utils/Colors.dart';
import 'package:explorer_your_city/src/Utils/Paddins.dart';
import 'package:explorer_your_city/src/Models/Categorias.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key, Categoria categoria}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  Services _services = Services();
  bool isLoading = true;
  DocumentSnapshot data;
  QuerySnapshot _datos;
  int _selectIndex;
  DocumentSnapshot search;
  String tipo;

  bool isError = true;

  @override
  void initState() {
    Services().getDataUser((userDocument) {
      setState(() {
        data = userDocument;
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: render(),
    );
  }

  Widget render() {
    Size size = MediaQuery.of(context).size;
    if (isLoading) {
      return SafeArea(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              CircularProgressIndicator(backgroundColor: Colors.green),
              SizedBox(
                height: 20,
              ),
              Text('Estamos trayendo data')
            ],
          ),
        )),
      );
    }
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: kPaddinDefaulVertical,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.exit_to_app,
                          color: kColorBlack,
                          size: 28,
                        ),
                        onPressed: () {
                          _services.singOut();
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginandRegister()));
                        }),
                    CircleAvatar(
                      backgroundColor: Colors.green,
                    )
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  'Que deseas visitar hoy...',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
                ),
                Text('${data.data()['nombre']}',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.w800)),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categorias.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: kPaddinDefaulHorizontal - 5),
                        child: GestureDetector(
                          onTap: () async {
                            setState(() {
                              _selectIndex = index;
                              switch (index) {
                                case 0:
                                  tipo = 'Gastronomia';
                                  break;
                                case 1:
                                  tipo = 'Salud';
                                  break;
                                case 2:
                                  tipo = 'Recreacion';
                                  break;
                                case 3:
                                  tipo = 'Deporte';
                                  break;
                                default:
                                  tipo = 'Gastronomia';
                                  break;
                              }
                            });
                            _services.getSearchData(tipo).then((response){
                              setState(() => _datos = response);
                            });
                          },
                          child: Column(
                            children: [
                              Image.asset(categorias[index].path),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${categorias[index].name}',
                                style: TextStyle(fontSize: 16),
                              ),
                              Container(
                                height: 3,
                                width: 70,
                                color: _selectIndex == index
                                    ? Colors.green
                                    : Colors.white,
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: size.width,
                  height: size.height,
                  child: _datos == null? 
                  Container(
                    width: 300,
                    height: 300,
                  child: Column(
                    children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 20,),
                        Text('Estamos esperando que tomes una opcion')
                    ],)) :Search(dato: _datos),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
