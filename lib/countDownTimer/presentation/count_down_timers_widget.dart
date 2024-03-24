import 'package:dev/countDownTimer/presentation/count_down_timers_list_widget.dart';
import 'package:dev/countDownTimer/presentation/empty_count_down_timers_widget.dart';
import 'package:dev/sequence/controller/sequence_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CountDownTimersWidget extends StatelessWidget {
  const CountDownTimersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SequenceController>(
      builder: (context, sequenceController, child) {
        return sequenceController.durations.isEmpty
            ? const EmptyCountDownTimersWidget()
            : const CountDownTimersListWidget();
      },
    );
  }
}
