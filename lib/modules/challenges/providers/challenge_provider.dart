import 'package:flutter/foundation.dart';
import '../models/challenge_model.dart';

class ChallengeProvider with ChangeNotifier {
  List<Challenge> _challenges = [];

  List<Challenge> get challenges => _challenges;

  void addChallenge(Challenge challenge) {
    _challenges.add(challenge);
    notifyListeners();
  }

  void updateChallenge(Challenge challenge) {
    final index = _challenges.indexWhere((c) => c.id == challenge.id);
    if (index != -1) {
      _challenges[index] = challenge;
      notifyListeners();
    }
  }
}
