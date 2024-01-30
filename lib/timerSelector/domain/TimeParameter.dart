import '../../common/widget/ListWheelWidget.dart';

class TimeParameter {
  final String unit;
  final OnSelectedItemChangedCallback<int> addValue;
  final int maxValue;
  TimeParameter({required this.unit, required this.addValue, required this.maxValue});
}