import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Services {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  idTokenUser(Function(User userInfo) onState) {
    _firebaseAuth.idTokenChanges().listen((event) {
      onState(event);
    });
  }

  bool get isAuth =>
      _firebaseAuth.currentUser != null &&
      _firebaseAuth.currentUser.uid != null;

  Future createUser(String correo, String password, String nombre) async {
    final credencialAuth = await _firebaseAuth.createUserWithEmailAndPassword(
        email: correo, password: password);

    await _firestore
        .collection('Users')
        .doc(credencialAuth.user.uid)
        .set({'nombre': nombre, 'correo': correo, 'contraseña': password});
  }

  Future<bool> singIn(String correo, String password) async {
    try {
      final credentials = await _firebaseAuth.signInWithEmailAndPassword(
          email: correo, password: password);
      return credentials.user == null;
    } catch (e) {
      print(e);
      return true;
    }
  }

  Future<void> getDataUser(
      Function(DocumentSnapshot userDocument) onState) async {
    _firebaseAuth.authStateChanges().listen((event) async {
      final response =
          await _firestore.collection('Users').doc(event.uid).get();
      onState(response);
    });
  }

  Future getSearchData(String tipo) async {
    return await _firestore.collection(tipo).get();
  }

  Future singOut() async {
    await _firebaseAuth.signOut();
  }
}
