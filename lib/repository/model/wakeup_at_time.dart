import 'package:flutter/material.dart';
import 'package:sleeepy_time/repository/model/strategy/abs_sleep_strategy.dart';
import 'package:sleeepy_time/app_icons.dart';

class WakeUpAtTimeStrategy extends SleepStrategy {
  @override
  String getTitle() => "Durmiendo a las";

  @override
  String getSubtitle() => "deberías despertar en una de las siguientes horas:";

  @override
  String getActionText() => "Hora de Despertar";

  @override
  String getDescription() => 'Calcula el mejor momento para despertar';

  @override
  String getIcon() => AppIcons.sun;

  @override
  Future<TimeOfDay> getTime(BuildContext context) async {
    return await showTimePicker(
      helpText: 'Hora de Dormir:',
      context: context,
      initialTime: TimeOfDay.now(),
    ) as TimeOfDay;
  }

  @override
  TimeOfDay addTimes(TimeOfDay time, int num, int pretime) {
    final horita = DateTime.now();
    final nuevaHora = horita.copyWith(hour: time.hour, minute: time.minute);

    final Duration preTimeToAdd = Duration(minutes: pretime);
    final Duration timeAdded = Duration(
        hours: (num * 1.5).floor().toInt(), minutes: !(num % 2 == 0) ? 30 : 0);

    final resultado = nuevaHora.add(timeAdded).add(preTimeToAdd);
    return TimeOfDay(hour: resultado.hour, minute: resultado.minute);
  }


}
