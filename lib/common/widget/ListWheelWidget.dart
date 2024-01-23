import 'package:flutter/material.dart';

typedef OnSelectedItemChangedCallback<K> = void Function(K newValue);

class ListInfiniteWheel<T> extends StatelessWidget {
  static const double magnification = 1.25;
  static const int defaultItemSize = 14;
  static const double wheelPercentSize = 0.4;

  final List<T> items;
  final OnSelectedItemChangedCallback<T> onSelectedItemChangedCallback;
  const ListInfiniteWheel({super.key, required this.items, required this.onSelectedItemChangedCallback});

  @override
  Center build(BuildContext context) {
    final style = Theme
        .of(context)
        .textTheme
        .bodyMedium;
    Size size = MediaQuery.of(context).size;
    final viewportHeight = size.height;
    final padding = MediaQuery.of(context).viewPadding;
    final height = viewportHeight - padding.top - kToolbarHeight;
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: height*wheelPercentSize,
        ),
        child: ListWheelScrollView.useDelegate(
          itemExtent: (style?.fontSize ?? defaultItemSize) * 4,
          useMagnifier: true,
          magnification: magnification,
          physics: const FixedExtentScrollPhysics(),
          childDelegate: ListWheelChildLoopingListDelegate(
            children: this.items.map((value) => Text('$value', style: style,)).toList(),
          ),
          onSelectedItemChanged: (int index) {
            this.onSelectedItemChangedCallback(this.items[index]);
          },
        ),
      ),
    );
  }
}