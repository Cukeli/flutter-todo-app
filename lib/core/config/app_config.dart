import 'dart:io';
import 'package:flutter/foundation.dart';

enum Environment { web, mobile, emulator }

class AppConfig {
  // Automatically detect environment based on platform
  static Environment get _currentEnvironment {
    if (kIsWeb) {
      return Environment.web;
    } else if (Platform.isAndroid || Platform.isIOS) {
      // For mobile, we'll use mobile environment (physical device)
      // You can manually change this to Environment.emulator if testing on emulator
      return Environment.mobile;
    }
    return Environment.web; // fallback
  }
  
  // API Configuration
  static const String _localIp = '192.168.0.107'; // Your computer's IP address
  static const String _gatewayIp = '192.168.0.1'; // Router IP (alternative)
  static const String _hostname = 'MSI'; // Your computer's hostname
  static const String _emulatorIp = '10.0.2.2'; // Android emulator IP
  static const String _localhost = 'localhost'; // Web development
  static const int _port = 8080; // Use port 8080 since it works
  
  // Choose the appropriate base URL based on environment
  static String get apiBaseUrl {
    switch (_currentEnvironment) {
      case Environment.web:
        return 'http://$_localhost:$_port';
      case Environment.mobile:
        // Use IP address since hostname doesn't resolve on local network
        return 'http://$_localIp:$_port';
      case Environment.emulator:
        return 'http://$_emulatorIp:$_port';
    }
  }
  
  static String get todosEndpoint => '$apiBaseUrl/api/todos';
  
  // App Configuration
  static const String appName = 'Todo List App';
  static const String appVersion = '1.0.0';
  
  // Feature Flags
  static const bool enableDebugMode = false;
  static const bool enableAnalytics = false;
}
