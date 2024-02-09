import 'package:dev/timerSelector/domain/Timer.dart';
import 'package:flutter/material.dart';

class TimerController with ChangeNotifier {
  Timer? timer;
  void updateTimer(int duration) {
    if(timer == null) {
      timer = Timer(duration);
    } else {
      timer!.duration = duration;
    }
    notifyListeners();
  }
}
