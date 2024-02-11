import 'package:dev/common/widget/FilledCard.dart';
import 'package:dev/countDownTimer/presentation/CountDownTimer.dart';
import 'package:dev/sequence/controller/SequenceController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountDownTimersListWidget extends StatelessWidget {
  const CountDownTimersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SequenceController sequenceController = context.watch<SequenceController>();
    Duration? currentDuration = sequenceController.getFirstDuration();
    Duration? nextDuration = sequenceController.getNextDuration();
    return Column(
      children: [
        FilledCard(child: nextDuration != null ? Text(nextDuration.toString()) : Text('no more duration')),
        CountDownTimer(duration: currentDuration ?? const Duration(seconds: 0))
      ],
    );
  }
}
