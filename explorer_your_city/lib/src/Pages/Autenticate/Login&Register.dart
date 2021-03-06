import 'package:explorer_your_city/src/Pages/Autenticate/Widget/BottomShowmodel.dart';
import 'package:explorer_your_city/src/Pages/Autenticate/Widget/TextFormDefauld.dart';
import 'package:explorer_your_city/src/Pages/Home/Home.dart';
import 'package:explorer_your_city/src/Repository/Repository.dart';
import 'package:explorer_your_city/src/Utils/Colors.dart';
import 'package:explorer_your_city/src/Utils/Paddins.dart';
import 'package:flutter/material.dart';

class LoginandRegister extends StatefulWidget {
  LoginandRegister({Key key}) : super(key: key);

  @override
  _LoginandRegisterState createState() => _LoginandRegisterState();
}

class _LoginandRegisterState extends State<LoginandRegister> {
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
                                  child: SingleChildScrollView(
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
                                        SizedBox(
                                          height: 10,
                                        ),
                                        BottomShowmodel(
                                          texto: 'Registro',
                                          textColor: kColorWhite,
                                          containerColor: Colors.green,
                                          ir: () async {
                                            await _service.createUser(
                                                correo, password, nombre);
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    ),
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
                      containerColor: kColorWhite,
                      ir: () => showModalBottomSheet<void>(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(30))),
                          context: context,
                          builder: (BuildContext _) {
                            return SafeArea(
                              child: Form(
                                key: _formKey,
                                child: Padding(
                                  padding: const EdgeInsets.all(17.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Bienvenido\n Explora tu Ciudad',
                                          style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700,
                                              color: kColorBlack),
                                        ),
                                        SizedBox(
                                          height: 40,
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
                                          height: 20,
                                        ),
                                        TextFormDefauld(
                                          valor: (value) {
                                            setState(() {
                                              password = value;
                                            });
                                          },
                                          tipo: 'Contraseña',
                                          obscurecer: true,
                                          helper: '123******',
                                        ),
                                        SizedBox(
                                          height: 40,
                                        ),
                                        BottomShowmodel(
                                          texto: 'Iniciar Sesion',
                                          textColor: Colors.green,
                                          containerColor: kColorWhite,
                                          ir: () async {
                                            final isError = await _service.singIn(
                                                correo, password);
                                            if (isError==true) {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          "Ocurrio un Error!"),
                                                      content: Text(
                                                          "Verifica la informacion que ingresaste"),
                                                    );
                                                  });
                                            } else {
                                              Navigator.pop(context);
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return Home();
                                              }));
                                            }
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    GestureDetector(
                        onTap: () {},
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
