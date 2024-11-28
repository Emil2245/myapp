import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TimeInput extends StatefulWidget {
  final ValueNotifier<int?> valueNotifier;

  TimeInput({super.key, required this.valueNotifier});

  @override
  _TimeInputState createState() => _TimeInputState();
}

class _TimeInputState extends State<TimeInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        labelText: 'Tiempo',
        labelStyle: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.onPrimary),
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.onPrimary,
            width: 2.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
        ),
        errorText: _validateInput(_controller.text),
      ),
      style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      onChanged: (value) {
        final int? number = int.tryParse(value);
        widget.valueNotifier.value = (number != null && number >= 1 && number <= 120) ? number : null;
      },
    );
  }

  String? _validateInput(String value) {
    if (value.isEmpty) return 'El campo no puede estar vacío';
    final int? number = int.tryParse(value);
    if (number == null) return 'Solo se permiten números';
    if (number < 1 || number > 120) return 'Debe ser un número entre 1 y 120';
    return null;
  }
}
