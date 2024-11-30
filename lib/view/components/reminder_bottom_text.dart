import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleeepy_time/controller/shared_state.dart';

class ReminderBottomText extends StatelessWidget {

  const ReminderBottomText({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<SharedState>(context);

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Ten en cuenta que esta app asume que tardas ${appState.sleepTime} minutos en quedarte dormida <3",
            style: Theme
                .of(context)
                .textTheme
                .titleLarge
                ?.copyWith(
                color: Theme
                    .of(context)
                    .colorScheme
                    .onPrimary,
                fontWeight: FontWeight.w300),
            textAlign: TextAlign.center,
            maxLines: null,
            softWrap: true,
          ),
        ],
      ),
    );
  }
}
