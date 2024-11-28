import 'package:flutter/material.dart';
import 'package:myapp/app_icons.dart';
import 'package:myapp/view/settings_view.dart';
import 'package:myapp/view/time_selection_view.dart';
import 'package:myapp/view/widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key, required this.title});

  final String title;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int? _sleepTime;
  TimeOfDay? selectedTime;

  @override
  void initState() {
    _loadSleepTime();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.15),
        child: AppBar(
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.normal),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).primaryColor,
          flexibleSpace: SafeArea(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  height: kToolbarHeight,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 48),
                        // Placeholder for spacing
                      ]),
                ),
                // Additional Content
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "¿Cuál horario elegirás?",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(
                                color:
                                    Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => SettingsView(
                      title: widget.title,
                    ),
                  ),
                ).then((_) {
                  _loadSleepTime(); // Vuelve a cargar la variable al regresar
                });
              },
              icon: Icon(
                Icons.settings,
                size: 25,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
      body: _sleepTime == null
          ? Center(
              child: Container(
                  color: Theme.of(context).colorScheme.primary,
                  child: CircularProgressIndicator()))
          : Container(
              color: Theme.of(context).colorScheme.primary,
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...[
                        CustomButton(
                          onPressed: () {
                            onPressed(mode: 1);
                          },
                          iconPath: AppIcons.moon,
                          topText: 'Calcula el mejor momento para dormir',
                          bottomText: 'Hora de Dormir',
                        ),
                        CustomButton(
                          onPressed: () {
                            onPressed(mode: 2);
                          },
                          iconPath: AppIcons.sun,
                          topText: 'Calcula el mejor momento para despertar',
                          bottomText: 'Hora de Despertar',
                        ),
                        CustomButton(
                          onPressed: () {
                            onPressed(mode: 3);
                          },
                          iconPath: AppIcons.clock,
                          topText: 'Calcula el mejor momento para despertar',
                          bottomText: 'Duerme Ahora',
                        ),
                        CustomButton(
                          onPressed: () {
                            onPressed(mode: 4);
                          },
                          iconPath: AppIcons.nap,
                          topText: 'Toma una siesta en este momento',
                          bottomText: 'Siestita <3',
                        ),
                      ].map(
                        (button) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 12.0),
                          child: button,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Future<void> onPressed({required int mode}) async {
    final pickedTime = (3 == mode || 4 == mode)
        ? TimeOfDay.now()
        : await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );

    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => TimeSelectionView(
            title: widget.title,
            time: pickedTime,
            preTime: _sleepTime ?? 30,
            mode: mode,
          ),
        ),
      );
    }
  }

  Future<void> _loadSleepTime() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _sleepTime = prefs.getInt('timeToSleep') ?? 30;
    });
  }
}
