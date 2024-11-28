import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app_icons.dart';
import 'widgets/set_sleep_time_button.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key, required this.title});

  final String title;

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  late String _storedValue = "No value saved";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(AppIcons.back),
          ),
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.normal),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...[
              SetSleepTimeButton(
                onPressed: () {},
              ),
            ].map(
              (button) => Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 12.0),
                child: button,
              ),
            )
          ],
        ));
  }

}
