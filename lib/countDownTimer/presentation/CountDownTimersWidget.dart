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
        return sequenceController.durations.isEmpty
            ? const EmptyCountDownTimersWidget()
            : const CountDownTimersListWidget();
      },
    );
  }
}
