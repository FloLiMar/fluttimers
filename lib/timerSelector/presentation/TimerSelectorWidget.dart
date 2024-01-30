import 'package:dev/timerSelector/domain/TimeParameter.dart';
import 'package:dev/timerSelector/domain/timer.dart';
import 'package:dev/timerSelector/presentation/TimeWheelWidget.dart';
import 'package:flutter/widgets.dart';
import '../../common/constants.dart' as constants;

class TimerSelectorWidget extends StatelessWidget {
  final Timer timer = Timer();

  TimerSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        TimeWheelWidget(timeParameter: TimeParameter(unit: 'm', addValue: timer.addMinutes, maxValue: constants.maxMinutes)),
        TimeWheelWidget(timeParameter: TimeParameter(unit: 's', addValue: timer.addSeconds, maxValue: constants.maxSeconds)),
      ],
    );
  }
}
