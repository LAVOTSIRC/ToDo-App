import 'package:flutter/widgets.dart';
import 'package:modul_6/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthNotifier with ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<bool> signUp(String email, String password) async {
    _setLoading(true);
    User? user = await _authService.signUp(email, password);
    _setLoading(false);
    return user != null;
  }

  Future<bool> signIn(String email, String password) async {
    _setLoading(true);
    User? user = await _authService.signIn(email, password);
    _setLoading(false);
    return user != null;
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}