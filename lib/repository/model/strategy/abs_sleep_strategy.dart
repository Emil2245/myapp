import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sleeepy_time/repository/model/strategy/isleep_strategy.dart';
import 'package:sleeepy_time/view/time_selection_view.dart';

abstract class SleepStrategy implements ISleepStrategy {
  Future<void> onPressed(BuildContext context, String title) async {
    final pickedTime = await getTime(context);

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => TimeSelectionView(
            title: title,
            time: pickedTime,
            strategy: this,
          ),
        ));
  }
  Future<void> onPressedRetry(BuildContext context, String title) async {
    final pickedTime = await getTime(context);
    Navigator.pop(context);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => TimeSelectionView(
            title: title,
            time: pickedTime,
            strategy: this,
          ),
        ));
  }
}
