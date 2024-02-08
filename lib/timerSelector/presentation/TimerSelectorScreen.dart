import 'package:dev/appBar/presentation/AppBarWidget.dart';
import 'package:dev/timerSelector/presentation/TimerSelectorWidget.dart';
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