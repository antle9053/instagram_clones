import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clones/resources/storage_methods.dart';

class AuthMethos {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser(
      {required String email,
      required String username,
      required String password,
      required String bio,
      required Uint8List file}) async {
    String res = "";
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          bio.isNotEmpty) {
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        String avatarUrl =
            await StorageMethods().uploadImageToStorage('avatars', file, false);

        _firestore.collection('users').doc(cred.user!.uid).set({
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'followings': [],
          'avatarUrl': avatarUrl
        });

        res = "Success";
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }

  Future<String> loginUser(String email, String password) async {
    String res = "";
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "Success";
      } else {
        res = "Please enter all the fields";
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }
}
