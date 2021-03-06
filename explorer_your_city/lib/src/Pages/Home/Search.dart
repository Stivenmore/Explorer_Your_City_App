import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  final QuerySnapshot dato;
  Search({
    Key key,
    @required this.dato,
  }) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final QuerySnapshot data = widget.dato;
    final List lista = data.docs;
    if (lista != null) {
      return ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      height: 200,
                      width: 500,
                      child: Image.network(
                        lista[index]['imagen'],
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Text(
                      lista[index]['descripcion'],
                      style: TextStyle(fontSize: 22),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Container(
                    child: Text(
                      lista[index]['direccion'],
                      style: TextStyle(fontSize: 22),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            );
          });
    }
    if (lista == null) {
      return AlertDialog(
        title: Text('Oh no!!'),
        content: Text('No hemos logrado encontrar datos'),
      );
    }
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.green,
      ),
    );
  }
}
