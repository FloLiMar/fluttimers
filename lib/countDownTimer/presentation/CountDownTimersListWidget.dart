import 'package:dev/timerSelector/controller/DurationTimerController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountDownTimersListWidget extends StatelessWidget {
  const CountDownTimersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(timerController.timer.toString())],
    );
    DurationTimerController durationController = context.watch<DurationTimerController>();
  }
}
