import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../common/constants.dart' as constants;

class SequenceListWidget extends StatelessWidget {
  const SequenceListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Padding(
        padding: const EdgeInsets.all(constants.smallSpace),child: TextField(controller: textEditingController, decoration: InputDecoration(
      suffixIcon: IconButton(icon: const Icon(Icons.clear), onPressed: textEditingController.clear,),
      labelText: AppLocalizations.of(context)!.sequenceName,
      border: const UnderlineInputBorder(),
    ),));
  }

}