import 'package:flutter/material.dart';

class KindSleepText extends StatelessWidget {
  final String textHeadline;

  const KindSleepText({super.key, required this.textHeadline});

  @override
  Widget build(BuildContext context) {
    return Text(
      textHeadline,
      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
          fontWeight: FontWeight.normal),
      textAlign: TextAlign.left,
    );
  }
}
