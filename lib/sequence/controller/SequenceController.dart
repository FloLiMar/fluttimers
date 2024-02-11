import 'package:flutter/material.dart';

class SequenceController with ChangeNotifier {
  List<Duration> durations = [];

  void addDuration(int secondDuration) {
    durations.add(Duration(seconds: secondDuration));
    notifyListeners();
  }

  Duration getFirstDuration() {
    return durations.first;
  }
}
