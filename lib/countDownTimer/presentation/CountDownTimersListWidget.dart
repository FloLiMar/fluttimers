import 'package:dev/timerSelector/controller/TimerController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountDownTimersListWidget extends StatelessWidget {
  const CountDownTimersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TimerController timerController = context.watch<TimerController>();
    return Column(
      children: [Text(timerController.timer.toString())],
    );
  }
}
