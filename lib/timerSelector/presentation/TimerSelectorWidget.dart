import 'package:dev/common/widget/NumberListWheelWidget.dart';
import 'package:dev/timerSelector/domain/timer.dart';
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
        NumberListWheelWidget(
            onSelectedItemChangedCallback: timer.addMinutes,
            maxValue: constants.maxMinutes),
        NumberListWheelWidget(
            onSelectedItemChangedCallback: timer.addSeconds,
            maxValue: constants.maxSeconds)
      ],
    );
  }
}
