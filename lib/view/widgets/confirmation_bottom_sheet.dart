import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:sleeepy_time/view/components/animated_clock.dart';

class ConfirmationBottomSheet extends StatelessWidget {
  final TimeOfDay? time;

  const ConfirmationBottomSheet({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      builder: (context, scrollController) {
        return Container(
          color: Theme.of(context).colorScheme.surfaceTint,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 35,
                height: 4,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              AnimatedClock(),
              Text(
                '¿Programar alarma a las ${time?.format(context) ?? 'No time set'}?',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context, 'cancelar');
                    },
                    child: Text(
                      'Cancelar',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .onPrimaryFixedVariant),
                    onPressed: () {
                      if (time != null) {
                        _setAlarm(context, time!);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Selecciona un tiempo para configurar la alarma."),
                          ),
                        );
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Aceptar',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _setAlarm(BuildContext context, TimeOfDay time) {
    final int hour = time.hour;
    final int minute = time.minute;

    final intent = AndroidIntent(
      action: 'android.intent.action.SET_ALARM',
      arguments: <String, dynamic>{
        'android.intent.extra.alarm.HOUR': hour,
        'android.intent.extra.alarm.MINUTES': minute,
        'android.intent.extra.alarm.SKIP_UI': false,
      },
    );

    intent.launch().catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error al configurar la alarma: $e")),
      );
    });
  }
}
