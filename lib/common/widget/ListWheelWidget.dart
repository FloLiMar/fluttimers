import 'package:flutter/material.dart';

typedef OnSelectedItemChangedCallback<K> = void Function(K newValue);

class ListInfiniteWheel<T> extends StatelessWidget {
  static const double magnification = 1.25;
  static const int defaultItemSize = 36;
  static const double itemExtent = 80;
  static const double itemNotSelectedOpacity = 0.5;

  final List<T> items;
  final OnSelectedItemChangedCallback<T> onSelectedItemChangedCallback;

  const ListInfiniteWheel(
      {super.key,
      required this.items,
      required this.onSelectedItemChangedCallback});

  @override
  Center build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.displaySmall;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxHeight: itemExtent * 3,
            maxWidth: (textStyle?.fontSize ?? defaultItemSize) * magnification),
        child: ListWheelScrollView.useDelegate(
          itemExtent: itemExtent,
          useMagnifier: true,
          magnification: magnification,
          overAndUnderCenterOpacity: itemNotSelectedOpacity,
          physics: const FixedExtentScrollPhysics(),
          childDelegate: ListWheelChildLoopingListDelegate(
            children: this
                .items
                .map((value) => Container(
                    alignment: Alignment.center,
                    child: Text(
                      '$value',
                      style: textStyle,
                    )))
                .toList(),
          ),
          onSelectedItemChanged: (int index) {
            this.onSelectedItemChangedCallback(this.items[index]);
          },
        ),
      ),
    );
  }
}
