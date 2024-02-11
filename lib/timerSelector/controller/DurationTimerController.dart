import 'package:flutter/material.dart';

class DurationTimerController with ChangeNotifier {
  Duration? duration;
  void updateDuration(int secondDuration) {
    duration = Duration(seconds: secondDuration);
    notifyListeners();
  }
}
