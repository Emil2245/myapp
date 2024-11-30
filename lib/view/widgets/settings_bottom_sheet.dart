import 'package:flutter/material.dart';
import 'package:sleeepy_time/view/components/time_input.dart';

class SettingsBottomSheet extends StatelessWidget {
  final int initialValue;

  const SettingsBottomSheet({super.key, required this.initialValue});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: 15+MediaQuery.of(context).viewInsets.bottom,
          left: 15,
          right: 15),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 14),
                child: Text(
                  "Selecciona el tiempo que tardas en quedarte dormida (máximo 120 minutos)",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w300,
                      ),
                  textAlign: TextAlign.center,
                  softWrap: true,
                  maxLines: null,
                ),
              ),
              TimeInput(),
            ],
          )
        ],
      ),
    );
  }
}
