import 'package:dev/countDownTimer/presentation/CountDownTimer.dart';
import 'package:dev/sequence/controller/SequenceController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountDownTimersListWidget extends StatelessWidget {
  const CountDownTimersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SequenceController sequenceController = context.watch<SequenceController>();
    return CountDownTimer(duration: sequenceController.getFirstDuration());
  }
}
