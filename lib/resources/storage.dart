import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class Storage {
  FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<String> storeData(
      String childName, Uint8List data, bool isPost) async {
    Reference ref =
        _firebaseStorage.ref().child(childName).child(_auth.currentUser!.uid);
    TaskSnapshot snap = await ref.putData(data);
    return await snap.ref.getDownloadURL();
  }
}
