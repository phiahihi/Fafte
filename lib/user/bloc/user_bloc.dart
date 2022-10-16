import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:chat_app_b/user/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '/auth/auth.dart';
import '/data/repository/app_repository.dart';
import '/data/sharedprefs/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBloc {
  UserRepository userRepository = UserRepository();
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  FutureOr<void> _signInUser(
    SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(Loading());
    try {
      // await authRepository
      //     .signIn(
      //   email: event.email,
      //   password: event.password,
      // )
      //     .then((uId) async {
      //   final _prefs = await SharedPreferences.getInstance();
      //   await _prefs.setString(Preferences.user_id, uId!);
      //   await _prefs.setBool(Preferences.is_logged_in, true);
      //   appRepository.setUserId = uId;
      //   emit(Loading());
      // }).then((value) {
      //   emit(Authenticated());
      // });
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }

  Future<DocumentSnapshot?> getUser() async {
    try {
      final uid = await FirebaseAuth.instance.currentUser?.uid;
      return _userCollection.doc(uid).get();
    } catch (e) {
      print(e);
    }
  }

  FutureOr<void> _signUpUser(
    SignUpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(Loading());
    try {
      // await authRepository.signUp(
      //   email: event.email,
      //   password: event.password,
      // );
      final _prefs = await SharedPreferences.getInstance();
      await _prefs.setBool(Preferences.is_logged_in, true).then((value) {
        emit(Authenticated());
      });
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }

  FutureOr<void> _forgotPassword(
    ForgotPasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(Loading());
    try {
      // await authRepository.forgotPassword(email: event.email).then((value) {
      //   emit(UnAuthenticated());
      // });
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }

  FutureOr<void> _signInWithGoogle(
    GoogleSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(Loading());
    try {
      // await authRepository.signInWithGoogle().then((uId) async {
      //   if (uId != null) {
      //     final _prefs = await SharedPreferences.getInstance();
      //     await _prefs.setString(Preferences.user_id, uId);
      //     await _prefs.setBool(Preferences.is_logged_in, true);
      //     appRepository.setUserId = uId;
      //   }
      // });
      // print('ahihi');
      // emit(Authenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }

  FutureOr<void> _signOut(
    SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(Loading());
    try {
      // await authRepository.signOut().then((value) {
      //   emit(UnAuthenticated());
      // });
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }

  FutureOr<void> _changePassword(
    ChangePasswordRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(Loading());
    try {
      // await authRepository
      //     .changePassword(password: event.password)
      //     .then((value) {
      //   emit(UnAuthenticated());
      // });
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }
}
