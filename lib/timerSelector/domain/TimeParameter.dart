import '../../common/widget/ListWheelWidget.dart';

class TimeParameter {
  final String unit;
  final OnSelectedItemChangedCallback<int> setValue;
  final int maxValue;
  TimeParameter({required this.unit, required this.setValue, required this.maxValue});
}