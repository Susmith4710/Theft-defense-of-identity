import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:idd_app/network/network_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NetworkManager manager = NetworkManager.instance;
  group('Network Tests', () {
    test('Login with credentials', () async {
      expect(await manager.doLogin('precomfam_ios@yopmail.com','Test@123'), isTrue);
    });

    test('Dashboard summary', () async {
      expect(await manager.getDashboardSummary(), isA<String>());
    });

    test('Alerts ', () async {
      expect(await manager.getAllAlerts(), isA<String>());
    });

    test('Monitored items', () async {
      print("--> <--");
      expect(await manager.getMonitoredItems(), isA<String>());
    });
    test('Credit score items', () async {
      print("--> <--");
      expect(await manager.getCreditScores(), isA<String>());
    });

    // test('User Profile', () async {
    //   print("-->USER PROFILE <--");
    //   expect(await manager.getUserProfile(), isA<UserProfile>());
    // });
  });
}
