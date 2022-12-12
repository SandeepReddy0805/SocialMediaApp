import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:social_media_app/resources/storage.dart';

class Authentication {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String> signupUser(
      {required String email,
      required String password,
      required String bio,
      required String username,
      required Uint8List file}) async {
    String res = '';
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          bio.isNotEmpty &&
          username.isNotEmpty) {
        UserCredential creds = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        String profilePicUrl =
            await Storage().storeData('profilePics', file, false);
        _firestore.collection('users').doc(creds.user!.uid).set({
          'username': username,
          'uid': creds.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
          'profilePic': profilePicUrl
        });

        res = 'success';
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
