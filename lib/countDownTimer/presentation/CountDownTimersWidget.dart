import 'package:dev/countDownTimer/presentation/CountDownTimersListWidget.dart';
import 'package:dev/countDownTimer/presentation/EmptyCountDownTimersWidget.dart';
import 'package:dev/sequence/controller/SequenceController.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CountDownTimersWidget extends StatelessWidget {
  const CountDownTimersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SequenceController>(
        builder: (context, sequenceController, child) {
          if (sequenceController.durations.isEmpty) {
            return const EmptyCountDownTimersWidget();
          }
          return const CountDownTimersListWidget();
        },
      );
  }
}
