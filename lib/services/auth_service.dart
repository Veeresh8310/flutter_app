import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_2/pages/home_page.dart';
import 'package:flutter_app_2/pages/login_page.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get user => _auth.authStateChanges();

  // Handle Authentication
  Widget handleAuthState () {
    return StreamBuilder(
      stream: user,
      builder: (BuildContext context, snapshot) {
         if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasData) {
          return HomePage(); // Return the actual widget for authenticated user
        } else {
          return LoginPage(); // Return the actual widget for non-authenticated user
        }
      },
    );
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Sign in with email and password
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register with email and password
  Future<User?> register(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
