import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/sub_challenge_model.dart';

class SubChallengesProvider with ChangeNotifier {
  List<SubChallenge> _subChallenges = [];
  bool _isLoading = false;
  String? _error;
  final String _baseUrl = 'https://kuriftu-backend.onrender.com/api/v1';

  // Getters
  List<SubChallenge> get subChallenges => _subChallenges;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Dummy data for sub-challenges
  final List<Map<String, dynamic>> _dummySubChallenges = [
    {
      '_id': 'sub1',
      'title': 'Morning Jog',
      'description': 'Complete a 2km morning jog around the resort',
      'points': 50,
      'status': 'pending'
    },
    {
      '_id': 'sub2',
      'title': 'Yoga Session',
      'description': 'Attend a 30-minute yoga session at the wellness center',
      'points': 30,
      'status': 'completed'
    },
    {
      '_id': 'sub3',
      'title': 'Healthy Breakfast',
      'description': 'Choose a healthy breakfast option from our special menu',
      'points': 20,
      'status': 'pending'
    },
    {
      '_id': 'sub4',
      'title': 'Nature Walk',
      'description':
          'Take a guided nature walk and identify 5 local plant species',
      'points': 40,
      'status': 'pending'
    },
  ];

  // Fetch sub-challenges for a challenge
  Future<void> fetchSubChallenges(String challengeId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 2));

      // Use dummy data instead of API call
      _subChallenges = _dummySubChallenges
          .map((json) => SubChallenge.fromJson(json))
          .toList();

      /* Commented out actual API call
      final response = await http.get(
        Uri.parse('$_baseUrl/challenges/$challengeId/sub-challenges'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'success') {
          _subChallenges = (data['data'] as List)
              .map((json) => SubChallenge.fromJson(json))
              .toList();
          _error = null;
        } else {
          _error = 'Failed to fetch sub-challenges';
        }
      } else {
        _error = 'Failed to fetch sub-challenges. Please try again.';
      }
      */
    } catch (e) {
      _error = 'An error occurred. Please try again.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Clear sub-challenges
  void clearSubChallenges() {
    _subChallenges = [];
    notifyListeners();
  }

  // Clear error
  void clearError() {
    _error = null;
    notifyListeners();
  }
}
