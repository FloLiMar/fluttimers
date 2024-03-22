import 'package:dev/common/style.dart';
import 'package:dev/common/widget/FilledCard.dart';
import 'package:dev/countDownTimer/presentation/CountDownTimer.dart';
import 'package:dev/countDownTimer/presentation/next_count_down_timer.dart';
import 'package:dev/sequence/controller/SequenceController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../common/constants.dart' as constants;

class CountDownTimersListWidget extends StatelessWidget {
  const CountDownTimersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SequenceController sequenceController = context.watch<SequenceController>();
    Duration? currentDuration = sequenceController.getDuration();
    return Column(children: [
      const NextCountDownTimer(),
      currentDuration != null
          ? CountDownTimer(
              duration: currentDuration,
              onEndHandler: sequenceController.increaseIndex,
              isAutoStart: sequenceController.index > 0,
            )
          : FilledCard(child: LayoutBuilder(
              builder: (BuildContext ctx, BoxConstraints constraints) {
              return SizedBox(
                  width: constraints.maxWidth,
                  child: getSvgWidget('FinishLine', constants.largeIcon));
            }))
    ]);
  }
}
