import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedState with ChangeNotifier {
  int _sleepTime = 30;

  int get sleepTime => _sleepTime;

  Future<void> loadSleepTime() async {
    final prefs = await SharedPreferences.getInstance();
    _sleepTime = prefs.getInt('timeToSleep') ?? 30;
    notifyListeners();
  }

  Future<void> updateSleepTime(int newSleepTime) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('timeToSleep', newSleepTime);
    _sleepTime = newSleepTime;
    notifyListeners();
  }
}
