import 'package:flutter/widgets.dart';

import '../../common/widget/NumberListWheelWidget.dart';
import '../domain/TimeParameter.dart';

class TimeWheelWidget extends StatelessWidget {
  final TimeParameter timeParameter;
  const TimeWheelWidget({super.key, required this.timeParameter});


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        NumberListWheelWidget(
            onSelectedItemChangedCallback: timeParameter.addValue,
            maxValue: timeParameter.maxValue),
        Text(timeParameter.unit)
      ],
    );
  }

}