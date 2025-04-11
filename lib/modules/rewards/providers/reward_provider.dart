import 'package:flutter/foundation.dart';
import '../models/reward_model.dart';

class RewardProvider with ChangeNotifier {
  final List<Reward> _rewards = [];

  List<Reward> get rewards => _rewards;

  void addReward(Reward reward) {
    _rewards.add(reward);
    notifyListeners();
  }

  void redeemReward(String rewardId) {
    final index = _rewards.indexWhere((r) => r.id == rewardId);
    if (index != -1) {
      _rewards[index] = Reward(
        id: _rewards[index].id,
        title: _rewards[index].title,
        description: _rewards[index].description,
        points: _rewards[index].points,
        isRedeemed: true,
      );
      notifyListeners();
    }
  }
}
