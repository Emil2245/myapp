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
  int? _sleepTime;

  @override
  void initState() {
    super.initState();
    _loadSleepTime();
  }

  Future<void> _loadSleepTime() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _sleepTime = prefs.getInt('timeToSleep') ?? 30; 
    });
  }

  Future<void> _updateSleepTime(int newTime) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('timeToSleep', newTime);
    setState(() {
      _sleepTime = newTime;
    });
  }

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
        body: Container(
          color: Theme.of(context).colorScheme.primary,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Ajustes:',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...[
                    SetSleepTimeButton(
                      onValueChanged: (int newValue) {
                        _updateSleepTime(newValue);
                      },
                      currentSleepTime: _sleepTime ?? 30,
                    ),
                  ].map(
                    (button) => Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      child: button,
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
