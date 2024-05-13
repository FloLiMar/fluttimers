import 'package:dev/sequence/presentation/sequence_timer_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common/constants.dart' as constants;

class SequenceWidget extends StatelessWidget {
  const SequenceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Padding(
        padding: const EdgeInsets.all(constants.smallSpace),
        child: Column(children: [
          TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: textEditingController.clear,
                ),
                labelText: AppLocalizations.of(context)!.sequenceName,
                border: const UnderlineInputBorder(),
              )),
          Flexible(
            child: Stack(alignment: Alignment.bottomRight, children: [
              const Column(children: [Expanded(child: SequenceTimerListWidget())]),
              Padding(
                  padding: const EdgeInsets.all(constants.smallSpace),
                  child: FloatingActionButton(
                    onPressed: () {
                      print("Tapped extended FAB");
                    },
                    child: const Icon(Icons.add),
                  )),
            ]),
          )
        ]));
  }
}
