import 'package:flutter/material.dart';
import 'package:sleeepy_time/repository/model/strategy/abs_sleep_strategy.dart';

import '../../app_icons.dart';

class NapStrategy extends SleepStrategy {
  @override
  String getTitle() => "Tomando una siesta ahora";

  @override
  String getSubtitle() => "deberías despertar a las:";

  @override
  String getActionText() => "Siestita <3";

  @override
  String getDescription() => 'Toma una siesta en este momento';

  @override
  String getIcon() => AppIcons.nap;

  @override
  TimeOfDay getTime(BuildContext context) => TimeOfDay.now();

  @override
  TimeOfDay addTimes(TimeOfDay time, int num, int pretime) {
    final horita = DateTime.now();
    final nuevaHora = horita.copyWith(hour: time.hour, minute: time.minute);

    final Duration preTimeToAdd = Duration(minutes: pretime);
    final Duration timeAdded = Duration(minutes: 26);
    //todo: reemplazar nuevaHora con Horita
    final resultado = nuevaHora.add(timeAdded).add(preTimeToAdd);
    return TimeOfDay(hour: resultado.hour, minute: resultado.minute);
  }

}
