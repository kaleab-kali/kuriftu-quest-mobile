import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:http/http.dart' as http;
import '../models/scan_model.dart';

class ScanProvider with ChangeNotifier {
  bool _isScanning = false;
  bool _isFlashOn = false;
  String? _error;
  bool _hasPermission = false;
  MobileScannerController? _controller;
  final String _baseUrl = 'https://kuriftu-backend.onrender.com/api/v1';

  // Getters
  bool get isScanning => _isScanning;
  bool get isFlashOn => _isFlashOn;
  String? get error => _error;
  bool get hasPermission => _hasPermission;
  MobileScannerController? get controller => _controller;

  // Initialize camera permission
  Future<void> initialize() async {
    final status = await Permission.camera.status;
    if (status.isDenied) {
      final result = await Permission.camera.request();
      _hasPermission = result.isGranted;
    } else {
      _hasPermission = status.isGranted;
    }
    notifyListeners();
  }

  // Initialize camera
  Future<void> initializeCamera() async {
    if (!_hasPermission) {
      await initialize();
      if (!_hasPermission) {
        _error = 'Camera permission is required';
        notifyListeners();
        return;
      }
    }

    try {
      _controller = MobileScannerController(
        facing: CameraFacing.back,
        torchEnabled: _isFlashOn,
      );
      notifyListeners();
    } catch (e) {
      _error = 'Failed to initialize camera: $e';
      notifyListeners();
    }
  }

  // Toggle scanning state
  Future<void> toggleScanning() async {
    if (!_hasPermission) {
      await initialize();
      if (!_hasPermission) {
        _error = 'Camera permission is required';
        notifyListeners();
        return;
      }
    }

    if (_isScanning) {
      await _controller?.dispose();
      _controller = null;
    } else {
      await initializeCamera();
    }

    _isScanning = !_isScanning;
    notifyListeners();
  }

  // Toggle flash
  Future<void> toggleFlash() async {
    if (_controller == null) return;
    try {
      await _controller!.toggleTorch();
      _isFlashOn = !_isFlashOn;
      notifyListeners();
    } catch (e) {
      _error = 'Failed to toggle flash: $e';
      notifyListeners();
    }
  }

  // Handle scanned QR code
  Future<void> handleScannedCode(String code) async {
    _isScanning = false;
    _error = null;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse('$_baseUrl/scans/verify'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'code': code}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['status'] == 'success') {
          final scanResult = ScanModel.fromJson(data['data']);
          print('Scan successful! Points earned: ${scanResult.points}');
        } else {
          _error = 'Invalid QR code';
        }
      } else {
        _error = 'Failed to verify QR code. Please try again.';
      }
    } catch (e) {
      _error = 'An error occurred. Please try again.';
    } finally {
      notifyListeners();
    }
  }

  // Clear error
  void clearError() {
    _error = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
