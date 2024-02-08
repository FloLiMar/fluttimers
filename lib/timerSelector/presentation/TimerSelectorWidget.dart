import 'package:dev/timerSelector/domain/TimeParameter.dart';
import 'package:dev/timerSelector/domain/timer.dart';
import 'package:dev/timerSelector/presentation/TimeWheelWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common/constants.dart' as constants;
import '../../common/style.dart';

class TimerSelectorWidget extends StatelessWidget {
  final Timer timer = Timer();

  TimerSelectorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [Expanded(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            TimeWheelWidget(
                timeParameter: TimeParameter(
                    unit: 'm',
                    setValue: timer.setMinutes,
                    maxValue: constants.maxMinutes)),
            TimeWheelWidget(
                timeParameter: TimeParameter(
                    unit: 's',
                    setValue: timer.setSeconds,
                    maxValue: constants.maxSeconds)),
          ],
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(bottom: constants.smallSpace),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: LayoutBuilder(
                  builder: (BuildContext ctx, BoxConstraints constraints) {
                return getMaxWidthMobileBuilder(
                    constraints,
                    ElevatedButton.icon(
                      onPressed: () {
                        print(timer.duration);
                      },
                      label: Text(AppLocalizations.of(ctx)!.validate),
                      icon: const Icon(
                        Icons.check,
                        size: constants.smallIcon,
                      ),
                    ));
              })),
        ))
      ],
    ))]);
  }
}
