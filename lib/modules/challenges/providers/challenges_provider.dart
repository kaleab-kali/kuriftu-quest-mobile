import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/challenge_model.dart';

class ChallengesProvider with ChangeNotifier {
  List<Challenge> _challenges = [];
  bool _isLoading = false;
  String? _error;
  String? _selectedCategory;
  final String _baseUrl = 'https://kuriftu-backend.onrender.com/api/v1';

  // Getters
  List<Challenge> get challenges => _challenges;
  bool get isLoading => _isLoading;
  String? get error => _error;
  String? get selectedCategory => _selectedCategory;

  // Get unique categories
  List<String> get categories {
    final categories = _challenges.map((c) => c.category).toSet().toList();
    categories.sort();
    return categories;
  }

  // Get filtered challenges by category
  List<Challenge> get filteredChallenges {
    if (_selectedCategory == null) return _challenges;
    return _challenges.where((c) => c.category == _selectedCategory).toList();
  }

  // Set selected category
  void setSelectedCategory(String? category) {
    _selectedCategory = category;
    notifyListeners();
  }

  // Fetch all challenges
  Future<void> fetchChallenges() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final response = await http.get(
        Uri.parse('$_baseUrl/challenges'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'success') {
          _challenges = (data['data'] as List)
              .map((json) => Challenge.fromJson(json))
              .toList();
          _error = null;
        } else {
          _error = 'Failed to fetch challenges';
        }
      } else {
        _error = 'Failed to fetch challenges. Please try again.';
      }
    } catch (e) {
      _error = 'An error occurred. Please try again.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Get challenge by ID
  Challenge? getChallengeById(String id) {
    try {
      return _challenges.firstWhere((c) => c.id == id);
    } catch (e) {
      return null;
    }
  }

  // Get challenges by category
  List<Challenge> getChallengesByCategory(String category) {
    return _challenges.where((c) => c.category == category).toList();
  }

  // Clear error
  void clearError() {
    _error = null;
    notifyListeners();
  }
}
