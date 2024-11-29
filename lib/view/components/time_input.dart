import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../controller/shared_state.dart';

class TimeInput extends StatefulWidget {
  final ValueNotifier<int?> valueNotifier;
  final int initialValue;

  const TimeInput({
    super.key,
    required this.valueNotifier,
    required this.initialValue,
  });

  @override
  _TimeInputState createState() => _TimeInputState();
}

class _TimeInputState extends State<TimeInput> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue.toString());
    widget.valueNotifier.value = widget.initialValue;
  }

  @override
  void dispose() {
    _controller.dispose();
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
            widget.valueNotifier.value =
                (number != null && number >= 1 && number <= 120)
                    ? number
                    : null;
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
                        final time = widget.valueNotifier.value;
                        if (time != null && time >= 1 && time <= 120) {
                          appState.updateSleepTime(time);
                          Navigator.pop(context,
                              time); // Cierra el modal y devuelve el valor válido.
                        } else {
                          // Cierra el teclado.
                          FocusScope.of(context).unfocus();
                          // Cierra el modal.
                          Navigator.pop(context);
                          // Muestra el mensaje de error con bordes redondeados.
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Por favor, ingresa un número válido',
                                textAlign: TextAlign.center,
                                maxLines: null,
                                softWrap: true,
                                style: TextStyle(
                                  fontSize: 25,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .onErrorContainer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    20), // Bordes redondeados.
                              ),
                              behavior: SnackBarBehavior.floating,
                              // Hace que el SnackBar sea flotante.
                              margin: EdgeInsets.all(
                                  16), // Margen para separar el SnackBar de los bordes.
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
