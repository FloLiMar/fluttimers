import 'package:flutter/material.dart';

import 'ListWheelWidget.dart';

class NumberListWheelWidget extends StatelessWidget {
  final OnSelectedItemChangedCallback<int> onSelectedItemChangedCallback;
  final int minValue;
  final int step;
  final int maxValue;

  const NumberListWheelWidget(
      {super.key,
      required this.onSelectedItemChangedCallback,
      required this.maxValue,
      this.minValue = 0,
      this.step = 1});

  @override
  Widget build(BuildContext context) {
    return ListInfiniteWheel<int>(
        items: [for (var i = minValue; i <= maxValue; i += step) i],
        onSelectedItemChangedCallback: onSelectedItemChangedCallback);
  }
}
