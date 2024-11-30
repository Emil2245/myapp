import 'package:flutter/material.dart';
import 'package:sleeepy_time/view/settings_view.dart';


class SettingsButton extends StatefulWidget {
  final String title;

  const SettingsButton({super.key, required this.title});

  @override
  State<SettingsButton> createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SettingsView(title: widget.title),
          ),
        );
      },
      icon: Icon(
        Icons.settings,
        size: 25,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
