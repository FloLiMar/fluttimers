import '../../common/widget/list_wheel_widget.dart';

class TimeParameter {
  final String unit;
  final OnSelectedItemChangedCallback<int> setValue;
  final int maxValue;
  TimeParameter({required this.unit, required this.setValue, required this.maxValue});
}