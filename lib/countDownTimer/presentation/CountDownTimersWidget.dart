import 'package:dev/countDownTimer/presentation/CountDownTimersListWidget.dart';
import 'package:dev/countDownTimer/presentation/EmptyCountDownTimersWidget.dart';
import 'package:dev/timerSelector/controller/DurationTimerController.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CountDownTimersWidget extends StatelessWidget {
  const CountDownTimersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DurationTimerController>(
        builder: (context, timerController, child) {
          if (timerController.duration == null) {
            return const EmptyCountDownTimersWidget();
          }
          return const CountDownTimersListWidget();
        },
      );
  }
}
