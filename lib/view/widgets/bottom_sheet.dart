import 'package:flutter/material.dart';
import 'package:myapp/view/components/time_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsBottomSheet extends StatelessWidget {
  const SettingsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int?> timeNotifier = ValueNotifier<int?>(null);

    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 35,
            height: 4,
            margin: const EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Column(
            children: [
              Text(
                "Selecciona el tiempo que tardas en quedarte dormida (máximo 120 minutos)",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
                maxLines: null,
              ),
              TimeInput(valueNotifier: timeNotifier),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * (2 / 3),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                            Theme.of(context).colorScheme.onPrimaryFixedVariant,
                          ),
                          onPressed: () async {
                            final time = timeNotifier.value;
                            if (time != null) {
                              await saveNumber(time);
                              Navigator.pop(context, 'confirmar');
                            } else {
                              // Muestra un mensaje o maneja el error aquí
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Por favor, ingresa un número válido'),
                                ),
                              );
                            }
                          },
                          child: Text(
                            'Aceptar',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * (2 / 3),
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context, 'Cancelar');
                          },
                          child: Text(
                            'Cancelar',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> saveNumber(int number) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('timeToSleep', number);
  }
}
