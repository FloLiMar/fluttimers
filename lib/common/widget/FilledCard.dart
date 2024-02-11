import 'package:flutter/material.dart';
import '../../common/constants.dart' as constants;

class FilledCard extends StatelessWidget {
  final Widget child;

  const FilledCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:  Padding(
        padding: const EdgeInsets.all(constants.smallSpace),
        child: Card(
        elevation: 0,
        color: Theme
            .of(context)
            .colorScheme
            .surfaceVariant,
        child: child,
      ),
    ));
  }
}