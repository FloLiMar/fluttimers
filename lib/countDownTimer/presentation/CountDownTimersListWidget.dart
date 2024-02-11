import 'package:dev/countDownTimer/presentation/CountDownTimer.dart';
import 'package:dev/timerSelector/controller/DurationTimerController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountDownTimersListWidget extends StatelessWidget {
  const CountDownTimersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    DurationTimerController durationController = context.watch<DurationTimerController>();
    return CountDownTimer(duration: durationController.duration ?? const Duration(seconds: 0));
  }
}
