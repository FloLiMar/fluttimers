import 'package:flutter/widgets.dart';
import 'package:numberpicker/numberpicker.dart';

class TimerSelector extends StatefulWidget {
  const TimerSelector({super.key});

  @override
  State<TimerSelector> createState() => _TimerSelectorState();
}

class _TimerSelectorState extends State<TimerSelector> {
  int _seconds = 0;
  int _minutes = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NumberPicker(
              value: _minutes,
              minValue: 0,
              maxValue: 59,
              onChanged: (value) => setState(() => _minutes = value),
            ),
            Text('min'),
            NumberPicker(
              value: _seconds,
              minValue: 0,
              maxValue: 59,
              onChanged: (value) => setState(() => _seconds = value),
            ),
            Text('s')
          ],
        ),
        Text('la valeur est $_minutes min $_seconds s')
      ],
    );
  }
}
