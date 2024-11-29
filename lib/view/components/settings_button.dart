import 'package:flutter/material.dart';

import '../loading_screen.dart';
import '../settings_view.dart';

class SettingsButton extends StatefulWidget {
  final String title;

  const SettingsButton({super.key, required this.title});

  @override
  State<SettingsButton> createState() => _SettingsButtonState();
}

class _SettingsButtonState extends State<SettingsButton> {

  @override
  Widget build(BuildContext context) {
    //todo: do we need a loading screen?
    return IconButton(
      onPressed: () async {
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => LoadingScreen(nextScreen: SettingsView(title: widget.title)),
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
