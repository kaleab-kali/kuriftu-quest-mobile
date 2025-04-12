import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/auth_models.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  String? _userId;
  User? _user;
  bool _isLoading = false;
  String? _error;

  // Form controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // Form validation states
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _isConfirmPasswordValid = false;

  // Getters
  bool get isAuthenticated => _token != null;
  bool get isLoading => _isLoading;
  String? get error => _error;
  User? get user => _user;
  String? get token => _token;

  // Form controller getters
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  // Form validation getters
  bool get isEmailValid => _isEmailValid;
  bool get isPasswordValid => _isPasswordValid;
  bool get isConfirmPasswordValid => _isConfirmPasswordValid;
  bool get isFormValid =>
      _isEmailValid && _isPasswordValid && _isConfirmPasswordValid;

  // Base URL for your API
  final String _baseUrl = 'https://kuriftu-backend.onrender.com/api/v1';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // Form validation methods
  void validateEmail(String value) {
    _isEmailValid = value.isNotEmpty && value.contains('@');
    notifyListeners();
  }

  void validatePassword(String value) {
    _isPasswordValid = value.isNotEmpty && value.length >= 6;
    notifyListeners();
  }

  void validateConfirmPassword(String value) {
    _isConfirmPasswordValid =
        value.isNotEmpty && value == _passwordController.text;
    notifyListeners();
  }

  // Clear form
  void clearForm() {
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    _isEmailValid = false;
    _isPasswordValid = false;
    _isConfirmPasswordValid = false;
    _error = null;
    notifyListeners();
  }

  Future<void> signup({
    required String email,
    required String password,
    String? name,
  }) async {
    if (!isFormValid) {
      _error = 'Please fill in all fields correctly';
      notifyListeners();
      return;
    }

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/auth/signup'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
          'name': name,
        }),
      );

      final data = json.decode(response.body);
      debugPrint("Response data: $data");

      if (response.statusCode == 201 || response.statusCode == 200) {
        if (data['success'] == true && data['data'] != null) {
          final userData = data['data']['user'];
          _user = User(
            id: userData['id'],
            email: userData['email'],
            name: name ?? userData['email'].split('@')[0],
            profileImage: null,
            points: 0,
            membershipTier: 'Bronze',
          );
          _error = null;
          clearForm();
        } else {
          _error = data['message'] ?? 'Failed to sign up. Please try again.';
        }
      } else {
        _error = data['message'] ?? 'Failed to sign up. Please try again.';
      }
    } catch (e) {
      debugPrint("Error during signup: $e");
      _error = 'An error occurred. Please try again.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    if (!_isEmailValid || !_isPasswordValid) {
      _error = 'Please enter valid email and password';
      notifyListeners();
      return;
    }

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/auth/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
        }),
      );

      final data = json.decode(response.body);
      debugPrint(
          "Response data: ${const JsonEncoder.withIndent('  ').convert(data)}");

      if (response.statusCode == 200) {
        if (data['success'] == true && data['session'] != null) {
          final userData = data['session']['user'];
          _user = User(
            id: userData['id'],
            email: userData['email'],
            name: userData['email'].split('@')[0],
            profileImage: null,
            points: 0,
            membershipTier: 'Bronze',
          );
          _token = data['session']['access_token'];
          _userId = userData['id'];
          _error = null;
          clearForm();
        } else {
          _error = data['message'] ?? 'Invalid email or password.';
        }
      } else {
        _error = data['message'] ?? 'Invalid email or password.';
      }
    } catch (e) {
      debugPrint("Error during login: $e");
      _error = 'An error occurred. Please try again.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;
    _user = null;
    _error = null;
    clearForm();
    notifyListeners();
  }

  Future<void> getUserProfile() async {
    if (_token == null) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/user/profile'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $_token',
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        _user = User.fromJson(data);
        _error = null;
      } else {
        final data = json.decode(response.body);
        _error = data['message'] ?? 'Failed to fetch user profile.';
      }
    } catch (e) {
      _error = 'An error occurred. Please try again.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
