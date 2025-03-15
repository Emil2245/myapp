import 'package:flutter/material.dart';
import 'package:sleeepy_time/view/widgets/set_alarm_button.dart';

class AlarmButton extends StatelessWidget {
  final VoidCallback onPressed;
  final TimeOfDay? time;
  final int num;

  const AlarmButton(
      {super.key,
      required this.onPressed,
      required this.time,
      required this.num});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Primer elemento: Número de ciclos
          Text(
            "$num ciclo${num > 1 ? 's' : ''}:\n ${(num * 1.5).toInt()}h ${num % 2 == 0 ? '' : '30min'}",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  fontWeight: FontWeight.w400,
                ),
          ),
          Text(
            time?.format(context) ?? "No time set",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SetAlarmButton(onPressed: onPressed, time: time),
        ],
      ),
    );
  }
}
