import 'package:flutter/material.dart';
import 'package:myapp/view/widgets/set_sleep_time_button.dart';
import 'package:myapp/view/widgets/bottom_sheet.dart';


import '../app_icons.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key, required this.title});

  final String title;

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  final String _storedValue = "No value saved";

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
      body: Center(
        //child: SetSleepTimeButton(onPressed: (){})
                child: DraggableScrollableSheetExample
                ()

      ),
    );
  }

  // Future<void> _saveValue() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('myKey', 'Hello, Flutter!');
  //   setState(() {
  //     _storedValue = 'Value saved: Hello, Flutter!';
  //   });
  // }
}
