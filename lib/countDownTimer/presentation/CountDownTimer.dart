import 'dart:async';

import 'package:dev/common/widget/FilledCard.dart';
import 'package:flutter/material.dart';
import '../../common/constants.dart' as constants;

typedef OnEndHandler = void Function();

class CountDownTimer extends StatefulWidget {
  final Duration duration;
  final OnEndHandler onEndHandler;
  final bool isAutoStart;

  const CountDownTimer(
      {super.key,
      required this.duration,
      required this.onEndHandler,
      required this.isAutoStart});

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

  @override
  void didUpdateWidget(CountDownTimer oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      localDuration = Duration(seconds: widget.duration.inSeconds);
      if (widget.isAutoStart) {
        startTimer();
      }
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
        widget.onEndHandler();
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
        child: FilledCard(
            child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '$minutes:$seconds',
          style: TextStyle(
              fontSize: constants.xLargeFont,
              color: Theme.of(context).colorScheme.onSurfaceVariant),
        ),
        const SizedBox(
          height: constants.smallSpace,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton.filled(
              onPressed: startTimer,
              icon: const Icon(Icons.play_arrow),
              iconSize: constants.mediumIcon,
            ),
            const SizedBox(
              width: constants.largeSpace,
            ),
            IconButton.filled(
              onPressed: () {
                if (countdownTimer == null || countdownTimer!.isActive) {
                  stopTimer();
                }
              },
              icon: const Icon(Icons.pause),
              iconSize: constants.mediumIcon,
            ),
          ],
        ),
      ],
    )));
  }
}
