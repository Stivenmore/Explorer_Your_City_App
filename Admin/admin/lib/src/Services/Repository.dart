import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Repository {
  FirebaseStorage _storage = FirebaseStorage.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future putPost(image, descripcion, direccion, clase) async {
    try {
      //Aqui se guarda la imagen en Storage
      final postimageRef = _storage.ref().child('Post imagen');
      var timekey = DateTime.now();

      final UploadTask uploadTask =
          postimageRef.child(timekey.toString() + '.jpg').putFile(image);
      var imageUrl = await (await uploadTask).ref.getDownloadURL();
      var url = imageUrl;
      //Aqui se guarda en la base de datos Firestore
      await _firestore.collection(clase).doc().set({
        'descripcion': descripcion,
        'imagen': url,
        'direccion': direccion,
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
