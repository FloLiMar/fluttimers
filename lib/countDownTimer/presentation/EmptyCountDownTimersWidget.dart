import 'package:dev/timerSelector/presentation/TimerSelectorScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common/constants.dart' as constants;

class EmptyCountDownTimersWidget extends StatelessWidget {
  const EmptyCountDownTimersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.alarm_add,
          size: constants.xxLargeIcon,
          color: Theme.of(context).colorScheme.primary,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: constants.mediumSpace),
          child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TimerSelectorScreen()),
                );
              },
              icon: const Icon(
                Icons.add,
                size: constants.smallIcon,
              ),
              label: Text(AppLocalizations.of(context)!.start)),
        )
      ],
    ));
  }
}
