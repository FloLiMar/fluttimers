import 'package:flutter/material.dart';

import '../../common/widget/number_list_wheel_widget.dart';
import '../domain/time_parameter.dart';

class TimeWheelWidget extends StatelessWidget {
  final TimeParameter timeParameter;

  const TimeWheelWidget({super.key, required this.timeParameter});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NumberListWheelWidget(
              onSelectedItemChangedCallback: timeParameter.setValue,
              maxValue: timeParameter.maxValue),
          Container(
              padding: const EdgeInsets.only(top: 14, left: 6),
              child: Text(
                timeParameter.unit,
                style: textStyle.bodyLarge,
              ))
        ],
      ),
    );
  }
}
