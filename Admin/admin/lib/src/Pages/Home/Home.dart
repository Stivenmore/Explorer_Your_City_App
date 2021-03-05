import 'dart:io';

import 'package:admin/src/Services/Repository.dart';
import 'package:admin/src/Utils/Paddins.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Repository _repository = Repository();
  String descripcion, direccion, clase;
  File image;
  final formkey = GlobalKey<FormState>();
  List categoria = ['Gastronomia', 'Deporte', 'Salud', 'Recreacion'];

  _HomeState({this.descripcion, this.direccion, this.image});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: kpaddins, horizontal: kpaddins),
            child: Center(
              child:
                  image == null ? Text('Selecciona una imagen') : metodosubir(),
            )),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_a_photo),
          onPressed: getImage,
        ),
      ),
    );
  }

  Widget metodosubir() {
    return SingleChildScrollView(
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
              key: formkey,
              child: Column(
                children: [
                  Image.file(
                    image,
                    height: 300,
                    width: 300,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration:
                        InputDecoration(labelText: 'Ingresa Descripcion'),
                    validator: (value) {
                      return value.isEmpty
                          ? 'Necesitamos la descripcion'
                          : null;
                    },
                    onChanged: (value){
                       setState(() {
                            descripcion = value;
                     });
                    },
                    onSaved: (value) {
                      setState(() {
                        descripcion = value;
                    });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Ingresa Direccion'),
                    validator: (value) {
                      return value.isEmpty
                          ? 'Necesitamos la descripcion'
                          : null;
                    },
                     onChanged: (value){
                       setState(() {
                            direccion = value;
                     });
                    },
                    onSaved: (value) {
                      setState(() {
                          direccion = value;
                    });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButton(
                      dropdownColor: Colors.purple,
                      onChanged: (value) {
                        setState(() {
                          clase = value;
                        });
                      },
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      hint: Text(
                        'Categoria',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      value: clase,
                      items: categoria.map((value) {
                        return DropdownMenuItem(
                            value: value, child: Text(value));
                      }).toList()),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.purple,
                        borderRadius: BorderRadius.circular(16)),
                    width: 120,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                        elevation: 0.0,
                        color: Colors.transparent,
                        onPressed: () async {
                          final response = await _repository.putPost(
                              image, descripcion, direccion, clase);
                          if (response == true) {
                            return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Guardado con Exito'),
                                    content: Text(
                                        'Puedes continuar agregando datos'),
                                  );
                                });
                          }else{
                            return showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Oh hemos tenido un problema'),
                                    content: Text(
                                        'Por favor intentalo mas tarde'),
                                  );
                                });
                          }
                        },
                        child: Text(
                          'Guardar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        )),
                  )
                ],
              )),
        ),
      ),
    );
  }

  Future getImage() async {
    // aqui obtiene la imagen
    final currentImage =
        await ImagePicker().getImage(source: ImageSource.gallery);

    setState(() {
      image = File(currentImage.path);
    });
  }
}
