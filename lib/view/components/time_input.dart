import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sleeepy_time/controller/shared_state.dart';
import 'package:provider/provider.dart';

class TimeInput extends StatefulWidget {
  const TimeInput({
    super.key,
  });

  @override
  _TimeInputState createState() => _TimeInputState();
}

class _TimeInputState extends State<TimeInput> {
  late TextEditingController _controller;
  late ValueNotifier<int?> valueNotifier;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final appState = Provider.of<SharedState>(context, listen: false);
    _controller.text = appState.sleepTime.toString();
    valueNotifier = ValueNotifier<int?>(appState.sleepTime);
  }

  @override
  void dispose() {
    _controller.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<SharedState>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          controller: _controller,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: InputDecoration(
            labelText: 'Tiempo: ${appState.sleepTime}',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            labelStyle:
                TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: Theme.of(context).colorScheme.onPrimary),
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onPrimary,
              width: 2.0,
            )),
            prefixStyle:
                TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
          onChanged: (value) {
            final int? number = int.tryParse(value);
            if (number != null && number >= 1 && number <= 120) {
              valueNotifier.value = number;
            }
          },
          onEditingComplete: () {
            // Actualizar la variable global al terminar de editar
            final int? time = int.tryParse(_controller.text);
            if (time != null && time >= 1 && time <= 120) {
              final appState =
                  Provider.of<SharedState>(context, listen: false);
              appState.updateSleepTime(time);
            } else {
              // Manejo de error si el número no es válido
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Por favor, ingresa un número válido entre 1 y 120.',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                ),
              );
            }
            FocusScope.of(context).unfocus(); // Cerrar teclado
          },
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
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
                      onPressed: () {
                        final int? time = int.tryParse(_controller.text);

                        if (time != null && time >= 1 && time <= 120) {
                          final appState =
                              Provider.of<SharedState>(context, listen: false);
                          appState.updateSleepTime(time);
                          Navigator.pop(context);
                        } else {
                          FocusScope.of(context).unfocus();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Por favor, ingresa un número válido entre 1 y 120.',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: Colors.white),
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
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
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * (2 / 3),
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cancelar',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(
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
        ),
      ],
    );
  }
}
