import 'package:dev/countDownTimer/presentation/CountDownTimersListWidget.dart';
import 'package:dev/countDownTimer/presentation/EmptyCountDownTimersWidget.dart';
import 'package:dev/timerSelector/controller/TimerController.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CountDownTimersWidget extends StatelessWidget {
  const CountDownTimersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerController>(
        builder: (context, timerController, child) {
          if (timerController.timer == null) {
            return const EmptyCountDownTimersWidget();
          }
          return const CountDownTimersListWidget();
        },
      );
  }
}
