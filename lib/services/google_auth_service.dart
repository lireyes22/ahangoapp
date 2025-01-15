import 'package:flutter/services.dart'; // Necesario para SystemNavigator

import 'package:ahangoapp/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

class GoogleAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleUser;

  // Método para iniciar sesión con Google
  Future<bool> signInWithGoogle() async {
    try {
      googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser!.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        // ignore: unused_local_variable
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
            return true;
      }
      return false;
    } catch (e) {
      SystemNavigator.pop();
      throw Exception('Error al iniciar sesión con Google: $e');
    }
  }

  // Método para obtener el ID Token actual
  Future<String?> getIdToken() async {
    try {
      final User? user = _auth.currentUser;
      if (user != null) {
        final token = await user.getIdToken(true);
        Logger().i('ID Token (obtenido): $token');
        return token;
      } else {
        Logger().e('No hay usuario autenticado');
        return null;
      }
    } catch (e) {
      Logger().e('Error al obtener el ID Token: $e');
      return null;
    }
  }

  // Método para obtener la información del usuario
  UserModel getUserInfo() {
    try {
      final User? user = _auth.currentUser;
      if (user != null && _auth.currentUser != null) {
        return UserModel(
          uid: _auth.currentUser!.uid,
          email: _auth.currentUser!.email ?? '',
          name: _auth.currentUser!.displayName ?? '',
          phoneNumber: _auth.currentUser!.phoneNumber ?? '',
          photoURL: _auth.currentUser!.photoURL ?? '',
          tokenId: _auth.currentUser!.getIdToken().toString(),
        );
      } else {
        Logger().e('No hay usuario autenticado o no hay datos del proveedor');
        return UserModel(
            uid: "",
            email: "",
            name: "",
            phoneNumber: "",
            photoURL: "",
            tokenId: "");
      }
    } catch (e) {
      throw Exception('Error al obtener la información del usuario');
    }
  }

  void signOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      throw Exception('Error al cerrar sesión: $e');
    }
  }
}
