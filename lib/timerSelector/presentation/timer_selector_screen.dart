import 'package:dev/appBar/presentation/app_bar_widget.dart';
import 'package:dev/timerSelector/presentation/timer_selector_widget.dart';
import 'package:flutter/material.dart';

class TimerSelectorScreen extends StatelessWidget {
  const TimerSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: TimerSelectorWidget(),
    );
  }

}