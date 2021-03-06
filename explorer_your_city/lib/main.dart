import 'package:explorer_your_city/src/Control.dart';
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
            primaryColor: Colors.green, backgroundColor: Colors.white)),
        home: Control());
  }
}

