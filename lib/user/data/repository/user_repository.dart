import 'dart:convert';

import 'package:chat_app_b/user/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/data/repository/app_repository.dart';
import '/data/sharedprefs/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final _firebaseAuth = FirebaseAuth.instance;
  final AppRepository appRepository = AppRepository();
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');
  // Future getUser(String uid) async {
  //   return _userCollection.doc(uid).snapshots().map((doc) {
  //     print('doc $doc');
  //   });
  // }

  // userData from snapshot
  // User _userDataFromSnapshot(DocumentSnapshot snapshot) {
  //   return UserData(
  //     uid: uid,
  //     nickname: snapshot.data['nickname'],
  //   );
  // }

  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final userCred = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return userCred.user?.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw Exception('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Wrong password provided for that user.');
      }
    }
  }

  Future<String?> forgotPassword({
    required String email,
  }) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      print('Password reset success ');
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future<String?> signInWithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();

      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((userCredential) async {
        if (userCredential.additionalUserInfo!.isNewUser) {
          await createNewUser(userCredential, userCredential.user?.displayName);
        } else {
          return userCredential.user?.uid;
        }
      });
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future createNewUser(
    UserCredential userCredential, [
    String? userName,
  ]) async {
    final userData = {
      'uid': userCredential.user?.uid,
      'email': userCredential.user?.email,
      'userName': userCredential.user?.displayName ?? userName,
    };
    try {
      final _prefs = await SharedPreferences.getInstance();
      final uId = userCredential.user?.uid;
      await _prefs.setString(Preferences.user_id, uId!);
      // appRepository.setUserId = uId;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> changePassword({required String password}) async {
    try {
      await FirebaseAuth.instance.currentUser?.updatePassword(password);
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
