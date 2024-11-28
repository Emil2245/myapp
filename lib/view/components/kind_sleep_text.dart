import 'package:flutter/material.dart';

class KindSleep extends StatelessWidget {
  final String textHeadline;

  const KindSleep({super.key, required this.textHeadline});

  @override
  Widget build(BuildContext context) {
    return Text(
      textHeadline,
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.normal),
      textAlign: TextAlign.left,
    );
  }
}
