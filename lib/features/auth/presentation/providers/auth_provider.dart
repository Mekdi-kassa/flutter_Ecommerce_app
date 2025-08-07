import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _userName;
  bool _isAuthenticated = false;

  String? get userName => _userName;
  bool get isAuthenticated => _isAuthenticated;

  Future<bool> signIn(String email, String password) async {
    // TODO: Replace with real API call
    await Future.delayed(Duration(seconds: 1));
    if (email == 'test@example.com' && password == 'password') {
      _userName = 'Test User';
      _isAuthenticated = true;
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<bool> signUp(String name, String email, String password) async {
    // TODO: Replace with real API call
    await Future.delayed(Duration(seconds: 1));
    _userName = name;
    _isAuthenticated = true;
    notifyListeners();
    return true;
  }

  void logout() {
    _userName = null;
    _isAuthenticated = false;
    notifyListeners();
  }
}