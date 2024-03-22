import 'package:flutter/material.dart';

class SequenceController with ChangeNotifier {
  List<Duration> durations = [];
  int index = 0;

  void addDuration(int secondDuration) {
    durations.add(Duration(seconds: secondDuration));
    durations.add(Duration(seconds: 5));
    durations.add(Duration(seconds: 5));
    notifyListeners();
  }

  void increaseIndex() {
    index++;
    notifyListeners();
  }

  Duration? getDuration() {
    return durations.length > index ? durations[index] : null;
  }

  Duration? getNextDuration() {
    return durations.length > index+1 ? durations[index+1] : null;
  }

  bool isLastNextDuration() {
    return getNextDuration() != null && durations.length == index+2;
  }
}
