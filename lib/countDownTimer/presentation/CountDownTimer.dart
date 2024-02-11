import 'dart:async';

import 'package:dev/common/widget/FilledCard.dart';
import 'package:flutter/material.dart';
import '../../common/constants.dart' as constants;

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
        child: FilledCard(
            child: Padding(
                padding: const EdgeInsets.all(constants.smallSpace),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '$minutes:$seconds',
                      style: TextStyle(fontSize: 80, color: Theme.of(context).colorScheme.onSurfaceVariant),
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
                            if (countdownTimer == null ||
                                countdownTimer!.isActive) {
                              stopTimer();
                            }
                          },
                          icon: const Icon(Icons.pause),
                          iconSize: constants.mediumIcon,
                        ),
                      ],
                    ),
                  ],
                ))));
  }
}
