import 'package:epingo/utils/useful_functions.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _user;
  String? _errorMessage;
  bool _isLoading = false;

  User? get user => _user;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _isLoading;

  AuthProvider() {
    _checkAuthState();
  }
  Future<void> _checkAuthState() async {
    _user = _auth.currentUser;
    if (_user != null) {
      _user = FirebaseAuth.instance.currentUser;
      notifyListeners();
    }
  }

  Future<void> login(
      String email, String password, BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = userCredential.user;
      _errorMessage = null;
      Navigator.pushNamedAndRemoveUntil(
        context,
        "/home",
        (Route<dynamic> route) => false,
      );
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message;
      showSnackbarWithColor(context, _errorMessage!, Colors.red);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signUp(
      String email, String password, String name, BuildContext context) async {
    _isLoading = true;
    notifyListeners();
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _user = userCredential.user;
      await _user!.updateDisplayName(name);

      await _firestore.collection('users').doc(_user!.uid).set({
        'name': name,
        'email': email,
      });

      _errorMessage = null;
      Navigator.pushNamedAndRemoveUntil(
        context,
        "/home",
        (Route<dynamic> route) => false,
      );
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message;
      showSnackbarWithColor(context, _errorMessage!, Colors.red);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut(BuildContext context) async {
    await _auth.signOut();
    _user = null;
    Navigator.pushReplacementNamed(context, '/');
    notifyListeners();
  }

  void clearErrorMessage() {
    _errorMessage = null;
    notifyListeners();
  }
}
