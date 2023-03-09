import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:mi_mang/core/client/database_api.dart';

class Api {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<User?> signInWithEmailAndPassword({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user!;

      DataBaseApi(uid: user.uid).savingUserData(fullName, email);

      return user;
    } on FirebaseAuthException catch (error) {
      log(error.toString());
    }
  }
}
