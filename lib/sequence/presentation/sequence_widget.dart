import 'package:dev/common/utils/duration_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/sequence_controller.dart';

class SequenceWidget extends StatelessWidget {
  const SequenceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SequenceController>(
      builder: (context, sequenceController, child) {
        List<Duration> durations = sequenceController.durations;
        return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: durations.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(printDuration(durations[index])),
              );
            });
      },
    );
  }
}
