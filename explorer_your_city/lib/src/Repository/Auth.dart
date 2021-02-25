import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Services {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future createUser(String correo, String password, String nombre) async {
    final credencialAuth = await _firebaseAuth.createUserWithEmailAndPassword(
        email: correo, password: password);

    await _firestore
        .collection('Users')
        .doc(credencialAuth.user.uid)
        .set({
          'nombre': nombre,
          'correo': correo,
          'contraseña': password
        });
  }
}
