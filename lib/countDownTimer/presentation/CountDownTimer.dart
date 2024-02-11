import 'dart:async';

import 'package:flutter/material.dart';

class CountDownTimer extends StatefulWidget {
  final Duration duration;
  const CountDownTimer({super.key, required this.duration});

  @override
  State<CountDownTimer> createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> {
  Timer? countdownTimer;
  Duration localDuration = const Duration(seconds: 0);

  @override
  void initState() {
    super.initState();
    setState(() {
      localDuration = Duration(seconds: widget.duration.inSeconds);
    });
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = localDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
      } else {
        localDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = strDigits(localDuration.inMinutes.remainder(60));
    final seconds = strDigits(localDuration.inSeconds.remainder(60));

    return Center(
        child: Column(
      children: [
        Text(
          '$minutes:$seconds',
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 50),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton.filled(
              onPressed: startTimer,
              icon: const Icon(Icons.play_arrow),
            ),
            IconButton.filled(
              onPressed: () {
                if (countdownTimer == null || countdownTimer!.isActive) {
                  stopTimer();
                }
              },
              icon: const Icon(Icons.pause),
            ),
          ],
        )
      ],
    ));
  }
}
