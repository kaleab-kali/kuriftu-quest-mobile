import 'package:flutter/foundation.dart';
import '../models/scan_model.dart';

class ScanProvider with ChangeNotifier {
  final List<ScanResult> _scanHistory = [];

  List<ScanResult> get scanHistory => _scanHistory;

  void addScanResult(ScanResult result) {
    _scanHistory.add(result);
    notifyListeners();
  }

  void clearHistory() {
    _scanHistory.clear();
    notifyListeners();
  }
}
