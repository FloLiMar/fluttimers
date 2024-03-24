import 'package:dev/common/style.dart';
import 'package:dev/common/utils/duration_utils.dart';
import 'package:dev/common/widget/filled_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:collection/collection.dart';

import '../../sequence/controller/sequence_controller.dart';
import '../../common/constants.dart' as constants;

class NextCountDownTimer extends StatelessWidget {
  const NextCountDownTimer({super.key});

  @override
  Widget build(BuildContext context) {
    SequenceController sequenceController = context.watch<SequenceController>();
    Duration? nextDuration = sequenceController.getNextDuration();
    bool isLastNextDuration = sequenceController.isLastNextDuration();
    final titleTextStyle = Theme.of(context)
        .textTheme
        .titleMedium
        ?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant);
    final durationTextStyle = Theme.of(context)
        .textTheme
        .headlineLarge
        ?.copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant);
    return nextDuration != null
        ? FilledCard(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  Text(AppLocalizations.of(context)!.next,
                      style: titleTextStyle),
                  Text(
                    printDuration(nextDuration),
                    style: durationTextStyle,
                  )
                ],
              ),
              isLastNextDuration
                  ? Padding(
                      padding:
                          const EdgeInsets.only(left: constants.smallSpace),
                      child: getSvgWidget('FinishLine', constants.mediumIcon))
                  : null
            ].whereNotNull().toList(),
          ))
        : const SizedBox.shrink();
  }
}
