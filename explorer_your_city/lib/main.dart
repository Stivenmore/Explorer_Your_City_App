import 'package:explorer_your_city/src/Repository/Auth.dart';
import 'package:explorer_your_city/src/Utils/Colors.dart';
import 'package:explorer_your_city/src/Utils/Paddins.dart';
import 'package:explorer_your_city/src/Widget/BottomShowmodel.dart';
import 'package:explorer_your_city/src/Widget/TextFormDefauld.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Explorer Your City',
        theme: (ThemeData(
          primaryColor: Colors.green,
        )),
        home: HomeMain());
  }
}

class HomeMain extends StatefulWidget {
  HomeMain({Key key}) : super(key: key);

  @override
  _HomeMainState createState() => _HomeMainState();
}

class _HomeMainState extends State<HomeMain> {
  final _formKey = GlobalKey<FormState>();
  String correo, password, nombre;

  Services _service = Services();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/quibdo.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              height: size.height,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kPaddinDefaulHorizontal * 2),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 80,
                    ),
                    Text(
                      'Disfruta el viaje\nconmigo',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: kColorBlack),
                    ),
                    SizedBox(
                      height: size.height * 0.55,
                    ),
                    BottomShowmodel(
                      texto: 'Registro',
                      textColor: kColorWhite,
                      containerColor: Colors.green,
                      ir: () => showModalBottomSheet<void>(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(30))),
                          backgroundColor: kColorWhite,
                          context: context,
                          builder: (BuildContext context) {
                            return Form(
                              key: _formKey,
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                              child: Text(
                                            'Nueva\n Cuenta',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w700,
                                                color: kColorBlack),
                                          )),
                                          GestureDetector(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16)),
                                              height: 50,
                                              width: 50,
                                              child: Icon(
                                                Icons.camera_alt,
                                                color: kColorGray,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextFormDefauld(
                                        valor: (value) {
                                          setState(() {
                                            correo = value;
                                          });
                                        },
                                        tipo: 'Correo',
                                        obscurecer: false,
                                        helper: 'Example@example.com',
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormDefauld(
                                        valor: (value) {
                                          password = value;
                                        },
                                        tipo: 'Contraseña',
                                        obscurecer: true,
                                        helper: '123*****',
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormDefauld(
                                        valor: (value) {
                                          nombre = value;
                                        },
                                        tipo: 'Nombre',
                                        obscurecer: false,
                                        helper: 'Kristian Y...',
                                      ),
                                      BottomShowmodel(
                                        texto: 'Registro',
                                        textColor: kColorWhite,
                                        containerColor: Colors.green,
                                        ir: () async {
                                          print('${correo},'+ '${password}'+' ${nombre}');
                                          await _service.createUser(
                                              correo, password, nombre);
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    BottomShowmodel(
                      texto: 'Iniciar Sesion',
                      textColor: Colors.green,
                      containerColor: Colors.white,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    GestureDetector(
                        child: Center(
                            child: Text(
                      'Olvidaste tu contraseña?',
                      style: TextStyle(fontSize: 18, color: kColorWhite),
                    ))),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
