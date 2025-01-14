import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NetworkInfo {
  final Connectivity connectivity;
  NetworkInfo(this.connectivity);

  Future<bool> get isConnected async {
    try {
      List<ConnectivityResult> _result = await connectivity.checkConnectivity();
      return _result.isNotEmpty && _result.any((result) => result != ConnectivityResult.none);
    } catch (e) {
      debugPrint("Error checking connectivity: $e");
      return false;
    }
  }

  static void checkConnectivity(BuildContext context) {
    bool _firstTime = true;
    Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> results) async {
      if (!_firstTime) {
        bool isNotConnected;
        if (results.isEmpty || results.every((result) => result == ConnectivityResult.none)) {
          isNotConnected = true;
        } else {
          isNotConnected = !await _updateConnectivityStatus();
        }

        if (isNotConnected) {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 6000),
              content: const Text(
                'No Internet Connection',
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 3),
              content: const Text(
                'Connected to the Internet',
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
      }
      _firstTime = false;
    });
  }

  static Future<bool> _updateConnectivityStatus() async {
    bool _isConnected = false;
    try {
      final List<InternetAddress> _result = await InternetAddress.lookup('google.com');
      if (_result.isNotEmpty && _result[0].rawAddress.isNotEmpty) {
        _isConnected = true;
      }
    } catch (e) {
      debugPrint("Error updating connectivity status: $e");
      _isConnected = false;
    }
    return _isConnected;
  }
}