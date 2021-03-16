import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nusocial/models/user.dart';
import 'package:nusocial/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user object based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(user.uid, null, null, null) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
    .map((FirebaseUser user) => _userFromFirebaseUser(user));
  }

  // sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      return null;
    }
  }

  // register with email & password
  Future registerWithEmailAndPassword(String name, int year, String major, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: name + "@nusocial.com", password: password);
      print(name + "@nusocial.com");
      FirebaseUser user = result.user;
      if (user != null) {
        User newUser = User(user.uid, name, year, major);
        //currentUser = thisUser;
        await DatabaseService(uid: user.uid).updateUser(newUser);
      }
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}