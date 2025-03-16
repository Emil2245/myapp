import 'dart:async';

import 'package:flutter/material.dart';

abstract class ISleepStrategy {
  String getTitle();

  String getSubtitle();

  String getActionText();

  String getDescription();

  String getIcon();

  FutureOr<TimeOfDay> getTime(BuildContext context);

  TimeOfDay addTimes(TimeOfDay time, int num, int pretime);
}
