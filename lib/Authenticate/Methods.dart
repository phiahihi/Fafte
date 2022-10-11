// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// import 'LoginScreen.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// Future<User?> createAccount(String name, String email, String password) async {
//   FirebaseAuth _auth = FirebaseAuth.instance;

//   FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   try {
//     UserCredential userCrendetial = await _auth.createUserWithEmailAndPassword(
//         email: email, password: password);

//     print("Account created Succesfull");

//     userCrendetial.user!.updateDisplayName(name);

//     await _firestore.collection('users').doc(_auth.currentUser!.uid).set({
//       "name": name,
//       "email": email,
//       "status": "Unavalible",
//       "uid": _auth.currentUser!.uid,
//     });

//     return userCrendetial.user;
//   } catch (e) {
//     print(e);
//     return null;
//   }
// }

// Future<User?> logIn(String email, String password) async {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   try {
//     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: email, password: password);

//     print("Login Sucessfull");
//     _firestore
//         .collection('users')
//         .doc(_auth.currentUser!.uid)
//         .get()
//         .then((value) => userCredential.user!.updateDisplayName(value['name']));

//     return userCredential.user;
//   } catch (e) {
//     print(e);
//     return null;
//   }
// }

// Future logOut(BuildContext context) async {
//   FirebaseAuth _auth = FirebaseAuth.instance;

//   try {
//     await _auth.signOut().then((value) {
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (_) => const LoginScreen()));
//     });
//   } catch (e) {
//     print(e);
//   }
// }

// Future forgotPassword(String email) async {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   try {
//     await _auth.sendPasswordResetEmail(email: email);
//     print('Password reset success ');
//   } catch (e) {
//     print("error");
//   }
// }

// Future changePassword(String newPassword) async {
//   final _auth = FirebaseAuth.instance.currentUser;
//   try {
//     await _auth?.updatePassword(newPassword);
//     print('Chang Password succesfully');
//   } catch (e) {
//     print(e);
//   }
// }

// Future signInWithGoogle() async {
//   // Trigger the authentication flow
//   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//   FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication? googleAuth =
//       await googleUser?.authentication;

//   // Create a new credential
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth?.accessToken,
//     idToken: googleAuth?.idToken,
//   );

//   final userCredential =
//       await FirebaseAuth.instance.signInWithCredential(credential);
//   await _firestore.collection('users').doc(userCredential.user!.uid).set({
//     "name": userCredential.user!.displayName,
//     "email": userCredential.user!.email,
//     "status": "Unavalible",
//     "uid": userCredential.user!.uid,
//   });
//   _firestore
//       .collection('users')
//       .doc(userCredential.user!.uid)
//       .get()
//       .then((value) => userCredential.user?.updateDisplayName(value['name']));
//   // Once signed in, return the UserCredential
//   print(userCredential.user);
//   return userCredential.user!.uid;
// }
